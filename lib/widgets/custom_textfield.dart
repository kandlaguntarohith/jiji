import 'package:flutter/material.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/utilities/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String value;
  final Function onSaved;
  final Function validator;
  final String hintText;
  final TextInputType textInputType;
  const CustomTextField(
      {Key key,
      @required this.value,
      @required this.onSaved,
      @required this.validator,
      @required this.hintText,
      @required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        SizeConfig.deviceWidth * 100 - (2 * deviceHorizontalPadding);
    final aspectRatio = 8 / 1;
    final textFieldheight = availableWidthSpace / aspectRatio;
    final textSize = textFieldheight * 0.25;

    final textFieldPadding = EdgeInsets.symmetric(
      horizontal: availableWidthSpace * 0.030,
    );

    return AspectRatio(
      aspectRatio: textInputType == TextInputType.multiline
          ? aspectRatio / 3
          : aspectRatio,
      child: Container(
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
            ),
            // textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.w400,
            ),
            keyboardType: textInputType,
            maxLines: textInputType == TextInputType.multiline ? 7 : 1,
            cursorColor: MyThemeData.primaryColor,
            // focusNode: _descriptionFocusNode,
            onSaved: (value) => onSaved(value),
            validator: (value) => validator(value),
          ),
        ),
      ),
    );
  }
}
