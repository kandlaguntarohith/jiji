import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/bottomnav.dart';
import 'package:jiji/pages/home.dart';
import 'package:jiji/pages/otp.dart';
import 'package:jiji/utilities/size_config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.deviceWidth * 5,
              vertical: SizeConfig.deviceHeight * 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Text(
                'SIGN IN',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 4,
              ),
              Text(
                "Welcome back to the community!",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 8,
              ),
              buildTextField("Phone or Email"),
              SizedBox(
                height: SizeConfig.deviceHeight * 2,
              ),
              buildTextField("Password"),
              SizedBox(
                height: SizeConfig.deviceHeight * 3,
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 1,
              ),
              buildButtonContainer(),
              SizedBox(
                height: SizeConfig.deviceHeight * 4,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 30,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Not a Member yet?"),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("SIGN UP",
                          style: TextStyle(
                              color: Hexcolor("#3DB83A"),
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: SizeConfig.deviceHeight * 2,
            bottom: SizeConfig.deviceHeight * 2,
            left: SizeConfig.deviceWidth * 2),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          // borderRadius: BorderRadius.circular(0),
        ),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNav(),
            ),
          );
        },
        child: Container(
          height: SizeConfig.deviceHeight * 6,
          width: SizeConfig.deviceWidth * 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Hexcolor("#3DB83A"),
          ),
          child: Center(
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
