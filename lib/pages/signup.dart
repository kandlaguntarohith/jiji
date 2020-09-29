import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/pages/otp.dart';
import 'package:jiji/utilities/size_config.dart';

import '../ThemeData.dart';
import '../ThemeData.dart';
import 'Widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String phone = "";
  String firstName = "";
  String lastName = "";
  String password = "";
  String emailId = "";
  final _form = GlobalKey<FormState>();

  Future<void> _saveForm() async {
    bool valid = _form.currentState.validate();
    if (valid) {
      _form.currentState.save();
      print(firstName + " " + lastName);
      print(password);
      print(emailId);
      print(phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        (SizeConfig.deviceWidth * 100) - (2 * deviceHorizontalPadding);
    final textSize = availableWidthSpace * 0.03;
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceHorizontalPadding),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: pHeight * 0.05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: textSize * 1.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              Container(
                width: pWidth,
                child: Text(
                  'Join a wonderful community!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textSize * 1.2,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.07,
              ),
              AspectRatio(
                aspectRatio: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: availableWidthSpace * 0.48,
                      child: CustomTextField(
                        value: firstName,
                        onSaved: (value) => setState(() => firstName = value),
                        validator: (value) {
                          if (value.isEmpty) return 'Enter First Name';
                          return null;
                        },
                        hintText: 'First Name',
                        textInputType: TextInputType.text,
                        isAspectRatio: false,
                      ),
                    ),
                    SizedBox(
                      width: availableWidthSpace * 0.48,
                      child: CustomTextField(
                        value: lastName,
                        onSaved: (value) => setState(() => lastName = value),
                        validator: (value) {
                          if (value.isEmpty) return 'Enter Last Name';
                          return null;
                        },
                        hintText: 'Last Name',
                        textInputType: TextInputType.text,
                        isAspectRatio: false,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              CustomTextField(
                value: emailId,
                onSaved: (value) => setState(() => emailId = value),
                validator: (value) {
                  if (value.isEmpty) return 'Enter Email';
                  return null;
                },
                hintText: 'Email',
                textInputType: TextInputType.text,
                aspectRatioValue: 9,
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              CustomTextField(
                value: phone,
                onSaved: (value) => setState(() => phone = value),
                validator: (value) {
                  if (value.isEmpty) return 'Enter Phone Number';
                  return null;
                },
                hintText: 'Phone',
                textInputType: TextInputType.number,
                aspectRatioValue: 9,
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              CustomTextField(
                value: password,
                onSaved: (value) => setState(() => password = value),
                validator: (value) {
                  if (value.isEmpty) return 'Enter Password';
                  return null;
                },
                hintText: 'Password',
                textInputType: TextInputType.text,
                aspectRatioValue: 9,
              ),
              SizedBox(
                height: pHeight * 0.04,
              ),
              AspectRatio(
                aspectRatio: 9,
                child: ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: RaisedButton(
                    onPressed: _saveForm,
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: textSize * 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    color: MyThemeData.primaryColor,
                  ),
                ),
              ),
              // SizedBox(
              //   height: pHeight * 0.3,
              // ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already a Member?",
                        style: TextStyle(fontSize: textSize),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: MyThemeData.primaryColor,
                          fontSize: textSize * 1.1,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.deviceHeight * 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
