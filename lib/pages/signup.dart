import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/pages/home.dart';
import 'package:jiji/pages/otp.dart';
import 'package:jiji/utilities/size_config.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController phone = new TextEditingController(text: '');
  TextEditingController name = new TextEditingController(text: '');
  TextEditingController lastname = new TextEditingController(text: '');
  TextEditingController password = new TextEditingController(text: '');
  TextEditingController email = new TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: pHeight,
                width: pWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: pHeight * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: SizeConfig.deviceHeight * 2.85,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico"),
                    ),
                  ],
                ),
                SizedBox(
                  height: pHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: pWidth,
                      child: Text(
                        'Join a wonderful community!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.deviceHeight * 2.35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: pHeight * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: pWidth * 0.40,
                      height: pHeight * 0.055,
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          // fillColor: kFormColor,
                          filled: true,
                          hintText: 'First Name',
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto', fontSize: pHeight * 0.020),
                        ),
                      ),
                    ),
                    Container(
                      width: pWidth * 0.40,
                      height: pHeight * 0.055,
                      child: TextFormField(
                        controller: lastname,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          // fillColor: kFormColor,
                          filled: true,
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto', fontSize: pHeight * 0.020),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: pHeight * 0.02,
                ),
                Container(
                  width: pWidth * 0.85,
                  height: pHeight * 0.055,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      // fillColor: kFormColor,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontFamily: 'Roboto', fontSize: pHeight * 0.020),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.02,
                ),
                Container(
                  width: pWidth * 0.85,
                  height: pHeight * 0.055,
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                          fontFamily: 'Roboto', fontSize: pHeight * 0.020),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.02,
                ),
                Container(
                  width: pWidth * 0.85,
                  height: pHeight * 0.055,
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                      hintStyle: TextStyle(
                          fontFamily: 'Roboto', fontSize: pHeight * 0.020),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: SizeConfig.deviceHeight * 5.5,
                    width: SizeConfig.deviceWidth * 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Hexcolor("#3DB83A"),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 170, 0, 0),
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already a Member?"),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("SIGN IN",
                              style: TextStyle(
                                  color: Hexcolor("#3DB83A"),
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
