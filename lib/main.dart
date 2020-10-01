import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:jiji/models/user_model.dart';
import 'package:jiji/pages/onboarding_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Box<UserModel> _userBox = await _hiveSetup();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Hexcolor("#3DB83A"), // status bar color
  ));
  runApp(MyApp(userBox: _userBox));
}

Future<Box<UserModel>> _hiveSetup() async {
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  final Box<UserModel> _userBox = await Hive.openBox<UserModel>('userModel');
  return _userBox;
}

class MyApp extends StatelessWidget {
  final Box<UserModel> userBox;
  MyApp({this.userBox});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jiji',
        theme: ThemeData(
          primarySwatch: Colors.green,
          hintColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: GettingStartedScreen());
  }
}
