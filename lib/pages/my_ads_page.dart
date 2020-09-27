import 'package:flutter/material.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/models/ad_item.dart';

import 'package:jiji/utilities/size_config.dart';

import 'package:jiji/widgets/ad_item.dart';
import 'package:share/share.dart';

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  String _selectedItem;
  List<String> _itemTypes = [
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
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: DropdownButton<String>(
                  hint: Text(_selectedItem ?? 'Select item'),
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
                      child: Text(page),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 20.0),
            ],
          ),
          SizedBox(height: 5),
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
                              SizedBox(width: 20.0),
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
                                          product: new Product(
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
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: _draftItemsList[index],
                              ),
                              SizedBox(width: 20.0),
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
                                          product: new Product(
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
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
