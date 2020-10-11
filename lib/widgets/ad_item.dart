import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/models/my_product.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/utilities/theme_data.dart';

class MyAdItemWidget extends StatelessWidget {
  final MyProduct itemModel;
  MyAdItemWidget({this.itemModel}) : assert(itemModel != null);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.deviceHeight, bottom: SizeConfig.deviceHeight),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: SizeConfig.deviceHeight * 2),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: SizedBox(
                height: SizeConfig.deviceWidth * 35,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: itemModel.photo.length > 0
                      ? "https://olx-app-jiji.herokuapp.com/api/post/photo/${itemModel.id}?photoId=${itemModel.photo[0].id}"
                      : "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.deviceWidth * 2.5),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.deviceWidth * 4,
                  right: SizeConfig.deviceWidth * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemModel.name,
                    style: TextStyle(
                      fontSize: SizeConfig.deviceWidth * 3.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: SizeConfig.deviceWidth * 4.5,
                    color: MyThemeData.primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.deviceWidth * 2),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.deviceWidth * 4,
                  right: SizeConfig.deviceWidth * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs. ${itemModel.price.toString()}',
                    style: TextStyle(
                      fontSize: SizeConfig.deviceWidth * 3.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3DB83A),
                    ),
                  ),
                  Text(
                    itemModel.city,
                    style: TextStyle(
                      fontSize: SizeConfig.deviceWidth * 3.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.deviceWidth * 2.5),
          ],
        ),
      ),
    );
  }
}
