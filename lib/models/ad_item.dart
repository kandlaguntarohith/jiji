import 'package:flutter/material.dart';

class MyAdItemModel {
  final String title;
  final int price;
  final String location;
  final String image;
  final bool isLiked;

  MyAdItemModel({
    @required this.title,
    @required this.price,
    @required this.location,
    @required this.image,
    this.isLiked = false,
  })  : assert(title != null),
        assert(price != null),
        assert(location != null),
        assert(image != null);
}
