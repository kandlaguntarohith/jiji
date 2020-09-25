import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiji/ThemeData.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/models/product.dart';
import 'package:jiji/pages/Widgets/custom_dropdrown.dart';
import 'package:jiji/pages/Widgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiji/pages/Widgets/item_images.dart';

class EditProductScreen extends StatefulWidget {
  static String routeName = '/EditProductScreen';
  final Product product;

  const EditProductScreen({Key key, this.product}) : super(key: key);
  @override
  _EditProductScreenState createState() => _EditProductScreenState(product);
}

class _EditProductScreenState extends State<EditProductScreen> {
  List<String> _states = [];
  List<String> _cities = [];
  List<String> _categories = [];
  List<String> _subCategories = [];
  List<File> images = [];
  final _form = GlobalKey<FormState>();
  String title;
  double price;
  String description;
  String state;
  String city;
  String category;
  String subCategory;

  final Product _product;
  final picker = ImagePicker();

  _EditProductScreenState(this._product);
  @override
  void initState() {
    _states.add("Maharashtra");
    _states.add("UP");
    _states.add("Kerela");
    _states.add("Delhi");
    _states.add("Goa");
    _cities.add("Pune");
    _cities.add("Mumbai");
    _cities.add("Banglore");
    _categories.add("Electronics");
    _categories.add("Gadgets");
    _categories.add("Other");
    _subCategories.add("Smart Watches");
    _subCategories.add("Mobiles");
    _subCategories.add("Laptops");
    if (_product != null) {
      title = _product.title;
      price = _product.price;
      description = _product.description;
      city = _product.city;
      state = _product.state;
      category = _product.category;
      subCategory = _product.subCategory;
    }
    super.initState();
  }

  Future<void> addImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        images.insert(0, File(pickedFile.path));
      }
    });
  }

  Future<void> _saveForm() async {
    bool valid = _form.currentState.validate();
    if (valid) {
      _form.currentState.save();
      print(title);
      print(price.toString());
      print(description);
      print(city + ", " + state);
      print(category + " " + subCategory);
    }
  }

  Widget renderhHeading(String heading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          heading,
          style: TextStyle(
            color: MyThemeData.inputPlaceHolder,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Ad",
                    style: TextStyle(
                      color: MyThemeData.inputPlaceHolder,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Need Help?",
                    style: TextStyle(
                      color: MyThemeData.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              renderhHeading("Item Name"),
              CustomTextField(
                value: title,
                noOfLines: 1,
                onSaved: (value) => setState(() => title = value),
                validator: (value) {
                  if (value.isEmpty) return 'Enter title';
                  return null;
                },
                hintText: 'Item Name',
                textInputType: TextInputType.text,
              ),
              renderhHeading("Item Price"),
              CustomTextField(
                value: price == null ? "" : price.toString(),
                noOfLines: 1,
                onSaved: (value) => setState(
                  () => price = double.parse(value),
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Enter price';
                  return null;
                },
                hintText: 'Item Price',
                textInputType: TextInputType.number,
              ),
              renderhHeading("Item Images"),
              ItemImages(
                images: images,
                addImageFunction: addImage,
                productUrlImages:
                    _product.imageUrl == null ? [] : _product.imageUrl,
              ),
              renderhHeading("Location"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownMenu(
                    hintText: "State",
                    items: _states,
                    value: state,
                    updateProductDetails: (String newValue) => setState(
                      () => state = newValue,
                    ),
                  ),
                  CustomDropDownMenu(
                    hintText: "City",
                    items: _cities,
                    value: city,
                    updateProductDetails: (String newValue) =>
                        setState(() => city = newValue),
                  ),
                ],
              ),
              renderhHeading("Item Category"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownMenu(
                    value: category,
                    hintText: "Category",
                    items: _categories,
                    updateProductDetails: (String newValue) => setState(
                      () => category = newValue,
                    ),
                  ),
                  CustomDropDownMenu(
                    value: subCategory,
                    hintText: "Sub Category",
                    items: _subCategories,
                    updateProductDetails: (String newValue) => setState(
                      () => subCategory = newValue,
                    ),
                  )
                ],
              ),
              renderhHeading("Item Description"),
              CustomTextField(
                value: description,
                noOfLines: 5,
                onSaved: (value) => setState(
                  () => description = value,
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Enter Description';
                  return null;
                },
                hintText: 'Item Description',
                textInputType: TextInputType.multiline,
              ),
              SizedBox(height: 30),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: RaisedButton(
                  onPressed: _saveForm,
                  child: Text(
                    "POST AD",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  color: MyThemeData.primaryColor,
                ),
              ),
              SizedBox(height: 20),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "or Save as a Draft",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: MyThemeData.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
