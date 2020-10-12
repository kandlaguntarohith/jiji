import 'package:flutter/material.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/utilities/size_config.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> items;
  final String value;
  final Function updateProductDetails;
  final String hintText;
  const CustomDropDownMenu(
      {Key key,
      this.items,
      this.value,
      this.updateProductDetails,
      this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        (SizeConfig.deviceWidth * 100) - (2 * deviceHorizontalPadding);
    final aspectRatio = 8 / 1;
    final textFieldheight = availableWidthSpace / aspectRatio;
    final textSize = textFieldheight * 0.25;

    final textFieldPadding = EdgeInsets.symmetric(
      horizontal: availableWidthSpace * 0.030,
    );

    return Container(
      padding: textFieldPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromRGBO(240, 240, 240, 1),
      ),
      // height: double.infinity,
      width: availableWidthSpace * 0.48,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: textSize,
                color: MyThemeData.inputPlaceHolder,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
            ),
            isEmpty: value == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (String newValue) => updateProductDetails(newValue),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
