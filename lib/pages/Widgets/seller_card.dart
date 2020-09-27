import 'package:flutter/material.dart';
import 'package:jiji/utilities/size_config.dart';

import '../../ThemeData.dart';

class SellerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        SizeConfig.deviceWidth * 100 - (2 * deviceHorizontalPadding);
    final aspectRatio = 3.5 / 1;
    final fieldheight = availableWidthSpace / aspectRatio;
    final textSize = fieldheight * 0.12;

    final padding = EdgeInsets.symmetric(
      horizontal: availableWidthSpace * 0.06,
    );

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Card(
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              Padding(
                padding: padding,
                child: CircleAvatar(
                  radius: fieldheight / 2.6,
                  backgroundImage: NetworkImage(
                    "https://lavinephotography.com.au/wp-content/uploads/2017/01/PROFILE-Photography-112.jpg",
                  ),
                ),
              ),
              SizedBox(width: availableWidthSpace * 0.02),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amy James",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: textSize,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "GOA, GA",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: textSize * 0.7,
                        color: MyThemeData.inputPlaceHolder,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: textSize,
                          color: Color.fromRGBO(255, 193, 7, 1),
                        ),
                        Text(
                          "4.8",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: textSize * 0.7,
                            color: MyThemeData.inputPlaceHolder,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
