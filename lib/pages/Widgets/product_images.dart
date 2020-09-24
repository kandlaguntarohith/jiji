import 'package:flutter/material.dart';

import '../../ThemeData.dart';
class ProductImages extends StatelessWidget {
  final int selectedImageIndex;
  final List<String> img;
  final Function updateSelectedImage;

  const ProductImages(
      {Key key, this.selectedImageIndex, this.img, this.updateSelectedImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: GestureDetector(
            onTap: () => updateSelectedImage(index),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      img[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedImageIndex == index
                        ? MyThemeData.primaryColor
                        : Colors.transparent,
                    width: 2,
                  )),
            ),
          ),
        ),
        itemCount: img.length,
      ),
    );
  }
}
