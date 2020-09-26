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
        height: 50,
        width: SizeConfig.deviceWidth * 42,
        child: RaisedButton.icon(
          color: isBorder == true ? Colors.white : MyThemeData.primaryColor,
          onPressed: () {},
          icon: icon,
          label: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.deviceWidth * 5,
              color: isBorder != true ? Colors.white : MyThemeData.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
