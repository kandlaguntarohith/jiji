import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jiji/constants/endpoints.dart';
import 'package:jiji/models/user_model.dart';
import 'package:http/http.dart' as http;

class DmController extends GetxController {
  var newMsg = ''.obs;
  var chatData = List().obs;
  var uid = ''.obs;
  var token = ''.obs;
  var typingDone = true.obs;

  TextEditingController msgController;
  ScrollController scroll;
  loadDetails(String rec) async {
    try {
      final Box<UserModel> _userBox =
          await Hive.openBox<UserModel>('userModel');
      uid.value = _userBox.values.first.uid;
      token.value = _userBox.values.first.token;
      await getHistory(rec, false);
    } on Exception {}
  }

  void moveBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scroll.hasClients) {
        print('scroll');
        scroll.animateTo(scroll.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
      } else {
        print('error');
      }
    });
  }

  Future getHistory(String rec, jump) async {
    try {
      var url = "${Endpoints.chatHistory}$uid?userId=$rec";
      var response = await http.get(
        url,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        chatData.value = jsonData;
        jump ? nothing() : moveBottom();
      }
    } on SocketException {
      print('No Internet');
    }
  }

  void nothing() {}

  // @override
  // onReady() {
  //   Get.dialog(CircularProgressIndicator());
  //   print('hello');
  //   super.onReady();
  // }

  @override
  onClose() {
    msgController?.dispose();
    super.onClose();
  }

  Future personalChat(String body, String rec) async {
    msgController.clear();
    typingDone.value = false;
    try {
      var data = {"to": rec, "body": body};
      var url = "${Endpoints.personalChat}$uid";
      var response = await http.post(
        url,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      print(response.statusCode);

      if (response.statusCode != 200) {
        Get.snackbar('Error', 'Failed to send message, please try again');
        typingDone.value = true;
      } else {
        var url = "${Endpoints.chatHistory}$uid?userId=$rec";

        var response = await http.get(
          url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Bearer $token",
          },
        );
        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          chatData.value = jsonData;
          print('fetched chat history');
          typingDone.value = true;
        }
      }
    } on SocketException {
      print('No Internet');
    }
  }
}
