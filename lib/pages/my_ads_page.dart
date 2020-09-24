import 'package:flutter/material.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/models/ad_item.dart';
import 'package:jiji/widgets/ad_item.dart';
import 'package:share/share.dart';

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  @override
  Widget build(BuildContext context) {
    String selectedItem;
    List<String> _itemTypes = [
      'Listed Items',
      'Sold Items',
      'Drafts',
    ];
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: DropdownButton<String>(
                  hint: Text(selectedItem ?? 'Select item'),
                  value: selectedItem,
                  onChanged: (String value) {
                    setState(() {
                      selectedItem = value;
                      print(selectedItem);
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
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  '32 ads',
                  style: TextStyle(
                    color: Color(0xff3DB83A),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.builder(
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
