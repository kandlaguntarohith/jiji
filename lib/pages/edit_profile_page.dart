import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:jiji/utilities/size_config.dart';

class EditProfilePage extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backPressWidget(context),
              SizedBox(
                height: SizeConfig.deviceHeight * 5,
              ),
              Center(child: ProfileImage()),
              SizedBox(
                height: SizeConfig.deviceHeight * 5,
              ),
              personalInfoEditTexts(),
              SizedBox(
                height: SizeConfig.deviceHeight * 3,
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Hexcolor("3DB83A"), width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      width: SizeConfig.deviceWidth * 42.5,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                                color: Hexcolor("3DB83A"),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.deviceWidth * 3.75),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.deviceWidth * 2,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: SizeConfig.deviceWidth * 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Hexcolor("3DB83A"),
                            borderRadius: BorderRadius.circular(5)),
                        width: SizeConfig.deviceWidth * 42.5,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.deviceHeight * 1.5),
                            child: Center(
                              child: Text(
                                'SAVE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.deviceWidth * 3.75),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget personalInfoEditTexts() {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Personal Information',
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.deviceWidth * 3.5),
          ),
          SizedBox(
            height: SizeConfig.deviceHeight * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.deviceWidth * 42.5,
                height: SizeConfig.deviceHeight * 7,
                child: TextField(
                    decoration: InputDecoration(
                  filled: true,
                  hintText: "Jane",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeConfig.deviceWidth * 3.5,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(0),
                  ),
                )),
              ),
              SizedBox(
                width: SizeConfig.deviceWidth * 5,
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 5),
                child: Container(
                  width: SizeConfig.deviceWidth * 42.5,
                  height: SizeConfig.deviceHeight * 7,
                  child: TextField(
                      decoration: InputDecoration(
                    filled: true,
                    hintText: "Smith",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: SizeConfig.deviceWidth * 3.5,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      // borderRadius: BorderRadius.circular(0),
                    ),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.deviceHeight * 3,
          ),
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 5),
            child: Container(
              height: SizeConfig.deviceHeight * 7,
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                hintText: "Goa, GA",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: SizeConfig.deviceWidth * 3.5,
                ),
                suffixIcon: Icon(
                  Icons.my_location,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  // borderRadius: BorderRadius.circular(0),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget backPressWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Hexcolor("F0F0F0"),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.deviceWidth * 5,
              top: SizeConfig.deviceHeight * 1,
              bottom: SizeConfig.deviceHeight * 1),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Hexcolor("3A3A3A"),
                size: SizeConfig.deviceWidth * 2.75,
              ),
              SizedBox(
                width: SizeConfig.deviceWidth * 1,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.deviceWidth * 3.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  double avatarRadius = SizeConfig.deviceWidth * 15;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Hexcolor("3DB83A"),
          ),
          child: Padding(
            padding: EdgeInsets.all(avatarRadius * 0.05),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpeg'),
              radius: avatarRadius,
            ),
          ),
        ),
        Positioned(
          top: avatarRadius * 1.2,
          left: avatarRadius * 1.5,
          child: Container(
            width: SizeConfig.deviceWidth * 7.5,
            child: FloatingActionButton(
              onPressed: null,
              elevation: 0,
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: SizeConfig.deviceWidth * 4,
              ),
              backgroundColor: Hexcolor("F0F0F0"),
            ),
          ),
        )
      ],
    );
  }
}
