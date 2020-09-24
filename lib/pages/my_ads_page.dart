import 'package:flutter/material.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/widgets/ad_item.dart';
import 'package:share/share.dart';

class MyAdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _itemsList = [
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 1',
          price: 100,
          location: 'Mumbai',
          image: 'assets/watch.jpg',
        ),
      ),
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 1',
          price: 100,
          location: 'Mumbai',
          image: 'assets/watch.jpg',
        ),
      ),
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 1',
          price: 100,
          location: 'Mumbai',
          image: 'assets/watch.jpg',
        ),
      ),
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 1',
          price: 100,
          location: 'Mumbai',
          image: 'assets/watch.jpg',
        ),
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: ListView.builder(
          itemCount: _itemsList.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: _itemsList[index],
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        iconSize: 28.0,
                        onPressed: null),
                    Text('Edit'),
                    IconButton(
                        icon: Icon(Icons.share),
                        iconSize: 28.0,
                        onPressed: () {
                          Share.share('Download Jiji now!');
                        }),
                    Text('Share'),
                    IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 28.0,
                        onPressed: () {
                          Share.share('Download Jiji now!');
                        }),
                    Text('Promote'),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
