import 'package:flutter/material.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/widgets/ad_item.dart';

class MyAdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _itemsList = [
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 1',
          price: 100,
          location: 'Mumbai',
        ),
      ),
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 2',
          price: 150,
          location: 'Delhi',
        ),
      ),
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 3',
          price: 200,
          location: 'Bangalore',
        ),
      ),
      MyAdItemWidget(
        itemModel: MyAdItemModel(
          title: 'Smartwatch 4',
          price: 250,
          location: 'Goa',
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
            return _itemsList[index];
          }),
    );
  }
}
