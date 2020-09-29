import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiji/ThemeData.dart';
import 'package:jiji/utilities/size_config.dart';

class ItemImages extends StatelessWidget {
  final List<File> images;
  final Function addImageFunction;
  final List<String> productUrlImages;

  const ItemImages(
      {Key key, this.images, this.addImageFunction, this.productUrlImages})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        SizeConfig.deviceWidth * 100 - (2 * deviceHorizontalPadding);

    final int imgCount = images.length + productUrlImages.length;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: availableWidthSpace * 0.9,
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => itemImageContainer(
                index < images.length
                    ? images[index]
                    : index < imgCount
                        ? productUrlImages[index - images.length]
                        : null,
              ),
              itemCount: max(imgCount, 3),
              // itemCount: imgCount,
            ),
          ),
          GestureDetector(
            onTap: () => showDialog(
                context: context,
                child: AlertDialog(
                  content: AspectRatio(
                    aspectRatio: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 5,
                            child: RaisedButton(
                              color: MyThemeData.primaryColor,
                              onPressed: () {
                                addImageFunction(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Camera",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.deviceHeight * 2),
                          AspectRatio(
                            aspectRatio: 5,
                            child: RaisedButton(
                              color: MyThemeData.primaryColor,
                              onPressed: () {
                                addImageFunction(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Gallery",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: MyThemeData.primaryColor),
              width: availableWidthSpace * 0.1,
              height: double.infinity,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget itemImageContainer(dynamic image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final cancelButtonSize = constraints.maxHeight * 0.2;
        return Stack(
          overflow: Overflow.visible,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                  child: image == null
                      ? SizedBox()
                      : image.runtimeType == String
                          ? Image.network(
                              image,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              image,
                              fit: BoxFit.cover,
                            ),
                ),
              ),
            ),
            // if (image != null)
            //   Positioned(
            //     // left: -cancelButtonSize / 2,
            //     // top: -cancelButtonSize / 2,
            //     child: Icon(
            //       Icons.cancel,
            //       color: Colors.red[600],
            //       size: cancelButtonSize,
            //     ),
            //   ),
          ],
        );
      },
    ),
  );
}
