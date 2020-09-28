import 'package:flutter/material.dart';
import 'package:jiji/utilities/size_config.dart';

import '../../ThemeData.dart';

class CustomButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final bool isBorder;
  final Color color;

  const CustomButton({Key key, this.icon, this.text, this.isBorder, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        (SizeConfig.deviceWidth * 100) - (2 * deviceHorizontalPadding);
    final textSize = availableWidthSpace * 0.04;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: isBorder == true ? 2 : 0,
            // width: 2,
            color: color,
          ),
        ),
        height: double.infinity,
        width: availableWidthSpace * 0.46,
        child: RaisedButton.icon(
          color: isBorder == true ? Colors.white : MyThemeData.primaryColor,
          onPressed: () {},
          icon: icon,
          label: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: textSize,
              color: isBorder != true ? Colors.white : MyThemeData.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
