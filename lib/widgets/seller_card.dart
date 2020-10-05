import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiji/models/posted_by.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:flutter_svg/svg.dart';

class SellerCard extends StatelessWidget {
  final PostedBy postedBy;

  const SellerCard({Key key, this.postedBy}) : super(key: key);
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
    String img = postedBy.photo;
    print("image" + img);
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
                  // backgroundImage: Net(img),
                  child: SvgPicture.network(img),
                ),
              ),
              SizedBox(width: availableWidthSpace * 0.02),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postedBy.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: textSize,
                      ),
                    ),
                    SizedBox(height: fieldheight * 0.1),
                    Text(
                      postedBy.city,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: textSize * 0.7,
                        color: MyThemeData.inputPlaceHolder,
                      ),
                    ),
                    SizedBox(height: fieldheight * 0.1),
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
