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
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedImageIndex == index
                      ? MyThemeData.primaryColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                  imageUrl:
                      "https://olx-app-jiji.herokuapp.com/api/post/photo/$categoryId?photoId=${img[index]}",
                  errorWidget: (context, url, error) => SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        "Image \nNot \nAvailable !",
                        style: TextStyle(
                          fontSize: 5,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: img.length,
      ),
    );
  }
}
