import 'package:flutter/material.dart';
import 'package:jiji/ThemeData.dart';
import 'package:jiji/utilities/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String value;
  final Function onSaved;
  final Function validator;
  final String hintText;
  final TextInputType textInputType;
  bool isAspectRatio;
  double aspectRatioValue;
  CustomTextField(
      {Key key,
      @required this.value,
      @required this.onSaved,
      @required this.validator,
      @required this.hintText,
      @required this.textInputType,
      this.isAspectRatio,
      this.aspectRatioValue})
      : super(key: key);

  Widget customWidget(EdgeInsetsGeometry textFieldPadding, double textSize) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: textFieldPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromRGBO(240, 240, 240, 1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          initialValue: value,
          decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: textSize,
              color: MyThemeData.inputPlaceHolder,
              fontWeight: FontWeight.w400,
            ),
          ).copyWith(
              suffixIcon:
                  hintText == "Password" ? Icon(Icons.visibility_off) : null),
          obscureText: hintText == "Password" ? true : false,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: textInputType,
          maxLines: textInputType == TextInputType.multiline ? 7 : 1,
          cursorColor: MyThemeData.primaryColor,
          onSaved: (value) => onSaved(value),
          validator: (value) => validator(value),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isAspectRatio ??= true;
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    var availableWidthSpace =
        SizeConfig.deviceWidth * 100 - (2 * deviceHorizontalPadding);
    // if (isSingleField) availableWidthSpace = availableWidthSpace * 0.45;
    final aspectRatio = aspectRatioValue == null ? 8 / 1 : aspectRatioValue;
    final textFieldheight = availableWidthSpace / aspectRatio;
    final textSize = textFieldheight * 0.25;

    final textFieldPadding = EdgeInsets.symmetric(
      horizontal: availableWidthSpace * 0.030,
    );

    return isAspectRatio
        ? AspectRatio(
            aspectRatio: textInputType == TextInputType.multiline
                ? aspectRatio / 3
                : aspectRatio,
            child: customWidget(
              textFieldPadding,
              textSize,
            ),
          )
        : customWidget(
            textFieldPadding,
            textSize,
          );
  }
}
