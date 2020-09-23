import 'package:flutter/material.dart';

class MyAdItemModel {
  final String title;
  final int price;
  final String location;
  final bool isLiked;

  MyAdItemModel({
    @required this.title,
    @required this.price,
    @required this.location,
    this.isLiked = false,
  })  : assert(title != null),
        assert(price != null),
        assert(location != null);
}
