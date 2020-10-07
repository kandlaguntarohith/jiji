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
  var chatData = List().obs;
  var msg = List().obs;
  var uid = ''.obs;
  var load = true.obs;
  TextEditingController msgController;

  Future getHistory(String rec) async {
    try {
      final Box<UserModel> _userBox =
          await Hive.openBox<UserModel>('userModel');
      uid.value = _userBox.values.first.uid;
      var token = _userBox.values.first.token;
      var url = "${Endpoints.chatHistory}$uid?userId=$rec";
      print(url);

      var response = await http.get(
        url,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        chatData.value = jsonData;
      }
    } on SocketException {
      print('No Internet');
    }
  }

  Future personalChat(String body, String to, String rec) async {
    try {
      var data = {"to": to, "body": body};

      print(to);
      final Box<UserModel> _userBox =
          await Hive.openBox<UserModel>('userModel');
      var uid = _userBox.values.first.uid;
      var token = _userBox.values.first.token;
      var url = "${Endpoints.personalChat}$uid";
      print(url);
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
      print(response.body);
      msgController.clear();
      var tsurl = "${Endpoints.chatHistory}$uid?userId=$rec";

      var res = await http.get(
        tsurl,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        print(jsonData);
        chatData.value = jsonData;
      }
    } on SocketException {
      print('No Internet');
    }
  }
}
