import 'package:flutter/material.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/models/product.dart';
import 'package:jiji/pages/edit_product_screen.dart';
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
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditProductScreen(
                            product: new Product(
                              id: "id1",
                              description: "This is a very good watch",
                              imageUrl: [
                                "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=989&q=80"
                              ],
                              price: 800.00,
                              title: "Mobile",
                              state: "Goa",
                              city: "Pune",
                              category: "Gadgets",
                              subCategory: "Mobiles",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text('Edit'),
                    IconButton(
                        icon: Icon(Icons.share),
                        iconSize: 28.0,
                        onPressed: null),
                    Text('Share'),
                    IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 28.0,
                        onPressed: null),
                    Text('Promote'),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
