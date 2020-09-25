import 'package:flutter/material.dart';
import 'package:jiji/ThemeData.dart';

class CustomTextField extends StatelessWidget {
  final String value;
  final int noOfLines;
  final Function onSaved;
  final Function validator;
  final String hintText;
  final TextInputType textInputType;

  const CustomTextField(
      {Key key,
      @required this.value,
      @required this.noOfLines,
      @required this.onSaved,
      @required this.validator,
      @required this.hintText,
      @required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(240, 240, 240, 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
    
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            
          ),
          keyboardType: textInputType,
          maxLines: noOfLines,
          cursorColor: MyThemeData.primaryColor,
          // focusNode: _descriptionFocusNode,
          onSaved: (value) => onSaved(value),
          validator: (value) => validator(value),
        ),
      ),
    );
  }
}
