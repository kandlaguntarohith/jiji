import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/welcome.png',
    title: 'Welcome!',
    description: 'Jiji is the best place to buy/sell anything to real people.',
  ),
  Slide(
    imageUrl: 'assets/welcome2.png',
    title: 'Huge Choice',
    description:
        'Browse tons of local listings you will find everything you need.',
  ),
  Slide(
    imageUrl: 'assets/welcome2.png',
    title: 'Easy Connection',
    description: 'You can use text or voice and call sellers / buyers.',
  ),
];
