import 'package:flutter/cupertino.dart';

class Product {
  String id;
  String title;
  String description;
  double price;
  List<String> imageUrl;
  String state;
  String city;
  String category;
  String subCategory;
  Product({
    @required this.id,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    @required this.state,
    @required this.city,
    @required this.category,
    @required this.subCategory,
  });
}
