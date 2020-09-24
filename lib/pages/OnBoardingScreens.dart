import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/pages/signin.dart';
import 'package:jiji/pages/signup.dart';

import '../widgets/slide_item.dart';
import '../models/slide.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // for (int i = 0; i < slideList.length; i++)
                              //   if (i == _currentPage)
                              // SlideDots(true)
                              // else
                              // SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Hexcolor("#3DB83A"))),
                      color: Hexcolor("#3DB83A"),
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side:
                              BorderSide(color: Hexcolor("#3DB83A"), width: 3)),
                      color: Colors.white,
                      textColor: Hexcolor("#3DB83A"),
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       'Have an account?',
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //     FlatButton(
                    //       child: Text(
                    //         'Login',
                    //         style: TextStyle(fontSize: 18),
                    //       ),
                    //       onPressed: () {
                    //         // Navigator.of(context)
                    //         //     .pushNamed(LoginScreen.routeName);
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "By continuing, you agree to the ",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 18)),
                      TextSpan(
                          text: "Policy and Rules",
                          style: TextStyle(
                              color: Hexcolor("#3DB83A"),
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ]),
                  )),
              // SizedBox(
              //   height: 50,
              // ),
            ])),
      ),
    );
  }
}
