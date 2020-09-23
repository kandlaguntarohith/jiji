import 'package:flutter/material.dart';
import 'package:jiji/components/jijiappbar.dart';

class MyAdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Container(),
    );
  }
}
