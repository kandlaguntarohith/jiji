import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:jiji/models/user_model.dart';
import 'package:jiji/pages/edit_profile_page.dart';
import 'package:jiji/pages/faq_page.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
            child: JijiAppBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopRowWidget(),
              ColouredHeading(
                title: "ACCOUNT AND PROFILE",
              ),
              StrechedButton(
                label: "Edit Profile",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => EditProfilePage()));
                },
              ),
              StrechedButton(
                label: "Change Email",
              ),
              StrechedButton(
                label: "Reset Password",
              ),
              ColouredHeading(
                title: "CONTACT AND SUPPORT",
              ),
              StrechedButton(
                label: "FAQ",
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FaqPage()));
                },
              ),
              StrechedButton(
                label: "Send Feedback",
              ),
              StrechedButton(
                label: "Contact Us",
              ),
              ColouredHeading(
                title: "RATE AND SHARE",
              ),
              StrechedButton(
                label: "Rate us on AppStore",
              ),
              StrechedButton(
                label: "Share with friends",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StrechedButton extends StatelessWidget {
  String label;
  Function onPressed;

  StrechedButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Hexcolor("#F0F0F0"))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.deviceHeight * 2.25,
              horizontal: SizeConfig.deviceWidth * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text(
                label,
                style: TextStyle(
                  color: Hexcolor("#3A3A3A"),
                  fontSize: SizeConfig.deviceHeight * 1.85,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class ColouredHeading extends StatelessWidget {
  String title;

  ColouredHeading({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.deviceWidth * 100,
      color: Hexcolor("3DB83A"),
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.deviceWidth * 5,
            top: SizeConfig.deviceHeight * 0.5,
            bottom: SizeConfig.deviceHeight * 0.5),
        child: Text(
          '$title',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.deviceHeight * 1.5),
        ),
      ),
    );
  }
}

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    final UserModel _userModel = _userBox.values.first;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.deviceWidth * 5,
            bottom: SizeConfig.deviceHeight * 4,
            top: SizeConfig.deviceHeight * 4),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Hexcolor("3DB83A"),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.deviceWidth * 8.5 * 0.05),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.jpeg'),
                  radius: SizeConfig.deviceWidth * 8.5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_userModel.firstName} ${_userModel.lastName}',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.deviceHeight * 2.75),
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 1,
                  ),
                  Text(
                    'Goa, GA',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.deviceHeight * 2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
