import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/models/my_product.dart';
import 'package:jiji/models/product(1).dart';
import 'package:jiji/pages/edit_product_screen.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/ad_item.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  String _selectedItem;
  List<String> _itemTypes = [
    'All Items',
    'Listed Items',
    'Sold Items',
    'Drafts',
  ];
  List<Widget> _listedItemsList = [
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
        title: 'Smartwatch 2',
        price: 100,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Smartwatch 3',
        price: 100,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Smartwatch 4',
        price: 100,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
  ];

  List<Widget> _soldItemsList = [
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Sold Item',
        price: 0,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Sold Item',
        price: 0,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
  ];

  List<Widget> _draftItemsList = [
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Smartwatch Draft',
        price: 100,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Smartwatch Draft',
        price: 100,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
    MyAdItemWidget(
      itemModel: MyAdItemModel(
        title: 'Smartwatch Draft',
        price: 100,
        location: 'Mumbai',
        image: 'assets/watch.jpg',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _listedItemsList = Provider.of<MyProduct>(context)
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.deviceHeight * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 8),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(_selectedItem ?? 'SELECT ITEM'),
                    value: _selectedItem,
                    onChanged: (String value) {
                      setState(() {
                        _selectedItem = value;
                        print(_selectedItem);
                      });
                    },
                    items: _itemTypes.map((String page) {
                      return DropdownMenuItem<String>(
                        value: page,
                        child: Text(page.toUpperCase()),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.deviceWidth * 8),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 8),
                child: Text(
                  '32 ads',
                  style: TextStyle(
                    color: Hexcolor("#3DB83A"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.deviceWidth * 1),
          _selectedItem == 'Listed Items'
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listedItemsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: _listedItemsList[index],
                          ),
                          SizedBox(width: SizeConfig.deviceWidth * 6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                iconSize: 28.0,
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditProductScreen(
                                      product: new MyProductModel(
                                        id: "id1",
                                        description:
                                            "This is a very good watch",
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
                              Text('EDIT'),
                              IconButton(
                                  icon: Icon(Icons.share),
                                  iconSize: 28.0,
                                  onPressed: () {
                                    Share.share('Download Jiji now!');
                                  }),
                              Text('SHARE'),
                              IconButton(
                                  icon: Icon(Icons.send),
                                  iconSize: 28.0,
                                  onPressed: () {
                                    Share.share('Download Jiji now!');
                                  }),
                              Text('PROMOTE'),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                )
              : _selectedItem == 'Sold Items'
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _soldItemsList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: _soldItemsList[index],
                              ),
                              SizedBox(width: SizeConfig.deviceWidth * 6),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    iconSize: 28.0,
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditProductScreen(
                                          product: new MyProductModel(
                                            id: "id1",
                                            description:
                                                "This is a very good watch",
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
                                  Text('EDIT'),
                                  IconButton(
                                      icon: Icon(Icons.share),
                                      iconSize: 28.0,
                                      onPressed: () {
                                        Share.share('Download Jiji now!');
                                      }),
                                  Text('SHARE'),
                                  IconButton(
                                      icon: Icon(Icons.send),
                                      iconSize: 28.0,
                                      onPressed: () {
                                        Share.share('Download Jiji now!');
                                      }),
                                  Text('PROMOTE'),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : _selectedItem == 'All Items'
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: _listedItemsList.length +
                                _draftItemsList.length +
                                _soldItemsList.length,
                            itemBuilder: (context, index) {
                              final _allItemsList = _listedItemsList +
                                  _draftItemsList +
                                  _soldItemsList;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: _allItemsList[index],
                                  ),
                                  SizedBox(width: SizeConfig.deviceWidth * 6),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        iconSize: 28.0,
                                        onPressed: () =>
                                            Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditProductScreen(
                                              product: new MyProductModel(
                                                id: "id1",
                                                description:
                                                    "This is a very good watch",
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
                                      Text('EDIT'),
                                      IconButton(
                                          icon: Icon(Icons.share),
                                          iconSize: 28.0,
                                          onPressed: () {
                                            Share.share('Download Jiji now!');
                                          }),
                                      Text('SHARE'),
                                      IconButton(
                                          icon: Icon(Icons.send),
                                          iconSize: 28.0,
                                          onPressed: () {
                                            Share.share('Download Jiji now!');
                                          }),
                                      Text('PROMOTE'),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: _draftItemsList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: _draftItemsList[index],
                                  ),
                                  SizedBox(width: SizeConfig.deviceWidth * 6),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        iconSize: 28.0,
                                        onPressed: () =>
                                            Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditProductScreen(
                                              product: new MyProductModel(
                                                id: "id1",
                                                description:
                                                    "This is a very good watch",
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
                                      Text('EDIT'),
                                      IconButton(
                                          icon: Icon(Icons.share),
                                          iconSize: 28.0,
                                          onPressed: () {
                                            Share.share('Download Jiji now!');
                                          }),
                                      Text('SHARE'),
                                      IconButton(
                                          icon: Icon(Icons.send),
                                          iconSize: 28.0,
                                          onPressed: () {
                                            Share.share('Download Jiji now!');
                                          }),
                                      Text('PROMOTE'),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
        ],
      ),
    );
  }
}
