import 'package:flutter/material.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/utilities/size_config.dart';

class MyAdItemWidget extends StatelessWidget {
  final MyAdItemModel itemModel;
  MyAdItemWidget({this.itemModel}) : assert(itemModel != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.deviceHeight, bottom: SizeConfig.deviceHeight),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 6.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: SizeConfig.deviceHeight * 2),
            Image.asset(
              itemModel.image,
              fit: BoxFit.fill,
            ),
            SizedBox(height: SizeConfig.deviceHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 4),
                  child: Text(
                    itemModel.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 4),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Color(0xff3DB83A),
                    onPressed: null,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 4),
                  child: Text(
                    'Rs. ${itemModel.price.toString()}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3DB83A),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 4),
                  child: Text(
                    itemModel.location,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.deviceHeight * 2.5),
          ],
        ),
      ),
    );
  }
}
