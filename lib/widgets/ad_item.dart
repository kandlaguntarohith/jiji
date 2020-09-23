import 'package:flutter/material.dart';
import 'package:jiji/models/ad_item.dart';

class MyAdItemWidget extends StatelessWidget {
  final MyAdItemModel itemModel;
  MyAdItemWidget({this.itemModel}) : assert(itemModel != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 6.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 15.0),
            Image.asset(
              itemModel.image,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    itemModel.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
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
                  padding: EdgeInsets.only(left: 16.0),
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
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(
                    itemModel.location,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
