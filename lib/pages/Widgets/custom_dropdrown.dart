import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(240, 240, 240, 1),
      ),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.42,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
              isEmpty: value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) =>
                      updateProductDetails(newValue),
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
      ),
    );
  }
}
