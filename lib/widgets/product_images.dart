import 'package:flutter/material.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductImages extends StatelessWidget {
  final int selectedImageIndex;
  final List<String> img;
  final String categoryId;
  final Function updateSelectedImage;

  const ProductImages(
      {Key key,
      this.selectedImageIndex,
      this.img,
      this.updateSelectedImage,
      this.categoryId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    img.forEach((element) {
      print(element);
    });
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
                  color: MyThemeData.inputPlaceHolder,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      "https://olx-app-jiji.herokuapp.com/api/post/photo/$categoryId?photoId=${img[index]}",
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
