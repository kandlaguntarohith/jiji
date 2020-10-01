import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:jiji/models/user_model.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

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
                    fontSize: SizeConfig.deviceHeight * 2.85,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 4),
                child: Text(
                  "Welcome back to the community!",
                  style: TextStyle(
                      fontSize: SizeConfig.deviceHeight * 2.35,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 6),
                child: buildTextField("Phone or Email"),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 3),
                child: buildTextField("Password"),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 4),
                child: buildButtonContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 4),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Not a Member yet?"),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text("SIGN UP",
                        style: TextStyle(
                            color: Hexcolor("#3DB83A"),
                            fontWeight: FontWeight.bold))
                  ],
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
          fontSize: SizeConfig.deviceWidth * 4,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          // borderRadius: BorderRadius.circular(0),
        ),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(
                        Icons.visibility_off,
                        size: SizeConfig.deviceWidth * 5,
                      )
                    : Icon(
                        Icons.visibility,
                        size: SizeConfig.deviceWidth * 5,
                      ),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  void _saveUserToHive() {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);

    final UserModel userModel = UserModel(
      uid: '',
      firstName: 'Amy',
      lastName: 'Jackson',
      photoUrl: '',
      emailId: '',
      phone: 0,
    );

    print('Saving user...');
    _userBox.add(userModel);
  }

  Widget buildButtonContainer() {
    _saveUserToHive();
    return InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNav(),
            ),
            (Route<dynamic> route) => false,
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
