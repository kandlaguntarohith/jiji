import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/bottomnav.dart';
import 'package:jiji/pages/chat_page.dart';
import 'package:jiji/pages/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Hexcolor("#3DB83A"), // status bar color
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNav(),
    );
  }
}
