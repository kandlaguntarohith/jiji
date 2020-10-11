import 'package:flutter/material.dart';
import 'package:jiji/models/my_product.dart';
import 'package:jiji/models/user_posts.dart';
import 'package:jiji/pages/edit_product_screen.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/utilities/theme_data.dart';
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

  List<MyProduct> _listedItemsList = [];

  List<MyProduct> _soldItemsList = [];

  List<MyProduct> _draftItemsList = [];
  @override
  void initState() {
    _selectedItem = _itemTypes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listedItemsList = Provider.of<UserPosts>(context, listen: true).myProducts;
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
                        child: Text(
                          page.toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: SizeConfig.deviceWidth * 3.2,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.deviceWidth * 8),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 8),
                child: Text(
                  (_selectedItem == 'Listed Items'
                          ? _listedItemsList.length.toString()
                          : _selectedItem == 'Sold Items'
                              ? _soldItemsList.length.toString()
                              : _selectedItem == 'All Items'
                                  ? (_listedItemsList.length +
                                          _soldItemsList.length +
                                          _draftItemsList.length)
                                      .toString()
                                  : _draftItemsList.length.toString()) +
                      " ads",
                  style: TextStyle(
                    color: MyThemeData.primaryColor,
                    fontSize: SizeConfig.deviceWidth * 3.2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.deviceWidth * 1),
          _selectedItem == 'Listed Items'
              ? _selectedItem.length <= 0
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: SizeConfig.deviceHeight * 20),
                      child: Text(
                        "No Ads Found !",
                        style: TextStyle(
                          color: MyThemeData.primaryColor,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _listedItemsList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: MyAdItemWidget(
                                  itemModel: _listedItemsList[index],
                                ),
                              ),
                              SizedBox(width: SizeConfig.deviceWidth * 6),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.edit,
                                      size: SizeConfig.deviceWidth * 6,
                                    ),
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditProductScreen(
                                          product: _listedItemsList[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'EDIT',
                                    style: TextStyle(
                                        fontSize: SizeConfig.deviceWidth * 2.5),
                                  ),
                                  SizedBox(height: SizeConfig.deviceWidth * 5),
                                  GestureDetector(
                                      child: Icon(
                                        Icons.share,
                                        size: SizeConfig.deviceWidth * 6,
                                      ),
                                      onTap: () {
                                        Share.share('Download Jiji now!');
                                      }),
                                  Text(
                                    'SHARE',
                                    style: TextStyle(
                                        fontSize: SizeConfig.deviceWidth * 2.5),
                                  ),
                                  SizedBox(height: SizeConfig.deviceWidth * 5),
                                  GestureDetector(
                                      child: Icon(
                                        Icons.send,
                                        size: SizeConfig.deviceWidth * 6,
                                      ),
                                      onTap: () {
                                        Share.share('Download Jiji now!');
                                      }),
                                  Text(
                                    'PROMOTE',
                                    style: TextStyle(
                                        fontSize: SizeConfig.deviceWidth * 2.5),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
              : _selectedItem == 'Sold Items'
                  ? _soldItemsList.length <= 0
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.deviceHeight * 20),
                          child: Text(
                            "No Ads Found !",
                            style: TextStyle(
                              color: MyThemeData.primaryColor,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _soldItemsList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: MyAdItemWidget(
                                      itemModel: _soldItemsList[index],
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.deviceWidth * 6),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                          size: SizeConfig.deviceWidth * 6,
                                        ),
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditProductScreen(
                                              product: _soldItemsList[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.deviceWidth * 2.5),
                                      ),
                                      SizedBox(
                                          height: SizeConfig.deviceWidth * 5),
                                      GestureDetector(
                                          child: Icon(
                                            Icons.share,
                                            size: SizeConfig.deviceWidth * 6,
                                          ),
                                          onTap: () {
                                            Share.share('Download Jiji now!');
                                          }),
                                      Text(
                                        'SHARE',
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.deviceWidth * 2.5),
                                      ),
                                      SizedBox(
                                          height: SizeConfig.deviceWidth * 5),
                                      GestureDetector(
                                          child: Icon(
                                            Icons.send,
                                            size: SizeConfig.deviceWidth * 6,
                                          ),
                                          onTap: () {
                                            Share.share('Download Jiji now!');
                                          }),
                                      Text(
                                        'PROMOTE',
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.deviceWidth * 2.5),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                  : _selectedItem == 'All Items'
                      ? _selectedItem.length <= 0
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.deviceHeight * 20),
                              child: Text(
                                "No Ads Found !",
                                style: TextStyle(
                                  color: MyThemeData.primaryColor,
                                ),
                              ),
                            )
                          : Expanded(
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
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: MyAdItemWidget(
                                          itemModel: _allItemsList[index],
                                        ),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.deviceWidth * 6),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  size: SizeConfig.deviceWidth *
                                                      8,
                                                ),
                                                Text(
                                                  'EDIT',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .deviceWidth *
                                                          2.5),
                                                ),
                                              ],
                                            ),
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProductScreen(
                                                  product: _allItemsList[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  SizeConfig.deviceWidth * 5),
                                          GestureDetector(
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.share,
                                                    size:
                                                        SizeConfig.deviceWidth *
                                                            8,
                                                  ),
                                                  Text(
                                                    'SHARE',
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .deviceWidth *
                                                            2.5),
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                Share.share(
                                                    'Download Jiji now!');
                                              }),
                                          SizedBox(
                                              height:
                                                  SizeConfig.deviceWidth * 5),
                                          GestureDetector(
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.send,
                                                    size:
                                                        SizeConfig.deviceWidth *
                                                            8,
                                                  ),
                                                  Text(
                                                    'PROMOTE',
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .deviceWidth *
                                                            2.5),
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                Share.share(
                                                    'Download Jiji now!');
                                              }),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                      : _draftItemsList.length <= 0
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: SizeConfig.deviceHeight * 20,
                              ),
                              child: Text(
                                "No Ads Found !",
                                style: TextStyle(
                                  color: MyThemeData.primaryColor,
                                ),
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
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: MyAdItemWidget(
                                          itemModel: _draftItemsList[index],
                                        ),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.deviceWidth * 6),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Icons.edit,
                                              size: SizeConfig.deviceWidth * 6,
                                            ),
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProductScreen(
                                                  product:
                                                      _draftItemsList[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'EDIT',
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.deviceWidth *
                                                        2.5),
                                          ),
                                          SizedBox(
                                              height:
                                                  SizeConfig.deviceWidth * 5),
                                          GestureDetector(
                                              child: Icon(
                                                Icons.share,
                                                size:
                                                    SizeConfig.deviceWidth * 6,
                                              ),
                                              onTap: () {
                                                Share.share(
                                                    'Download Jiji now!');
                                              }),
                                          Text(
                                            'SHARE',
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.deviceWidth *
                                                        2.5),
                                          ),
                                          SizedBox(
                                              height:
                                                  SizeConfig.deviceWidth * 5),
                                          GestureDetector(
                                              child: Icon(
                                                Icons.send,
                                                size:
                                                    SizeConfig.deviceWidth * 6,
                                              ),
                                              onTap: () {
                                                Share.share(
                                                    'Download Jiji now!');
                                              }),
                                          Text(
                                            'PROMOTE',
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.deviceWidth *
                                                        2.5),
                                          ),
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
