import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/bottomnav.dart';
import 'package:jiji/pages/home.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: pHeight,
              width: pWidth,
              child: Image.asset(
                'images/Background.png',
                fit: BoxFit.cover,
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
                        Icons.arrow_back,
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
                    'OTP',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: pHeight * 0.035),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: pWidth,
                    child: Text(
                      'Confirm your One Time Password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.65),
                          fontFamily: 'Roboto',
                          fontSize: pHeight * 0.02),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.035,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width * 0.8,
                fieldWidth: 60,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              SizedBox(
                height: pHeight * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNav(),
                    ),
                  );
                },
                child: Container(
                  width: pWidth * 0.85,
                  height: pHeight * 0.065,
                  decoration: BoxDecoration(
                    color: Hexcolor("#3DB83A"),
                    // color: kPrimaryColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Resending code in 01:03',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.75),
                        fontFamily: 'Roboto',
                        fontSize: pHeight * 0.018),
                  ),
                  SizedBox(
                    width: pWidth * 0.01,
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.03,
              ),
              Text(
                'Resend code',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Hexcolor("#3DB83A"),
                    fontFamily: 'Roboto',
                    fontSize: pHeight * 0.018),
              ),
            ],
          )
        ],
      ),
    );
  }
}
