import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/pages/product_details.dart';
import 'package:jiji/widgets/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "Goa, GA"),
    ListItem(2, "Assam"),
    ListItem(3, "Delhi"),
    ListItem(4, "Mumbai")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            style: TextStyle(color: Hexcolor("#3DB83A")),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
      child: Scaffold(
          appBar: PreferredSize(
            child: JijiAppBar(),
            preferredSize: Size.fromHeight(80.0),
          ),
          body: SingleChildScrollView(
              child: Stack(children: <Widget>[
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 10,
                  width: SizeConfig.blockSizeHorizontal * 80,
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeVertical * 20,
                      right: SizeConfig.blockSizeVertical * 5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _selectedItem,
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                          });

                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Hexcolor("#3DB83A"),
                          // );
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      top: SizeConfig.safeBlockHorizontal * 20),
                  child: Text(
                    'JIJI ASSIST',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: pHeight * 0.020),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeVertical * 1,
                        top: SizeConfig.blockSizeHorizontal * 30,
                        right: SizeConfig.blockSizeVertical * 1,
                        bottom: SizeConfig.blockSizeHorizontal * 70),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Hexcolor("#3DB83A"))),
                      color: Colors.white,
                      textColor: Hexcolor("#3DB83A"),
                      // padding: EdgeInsets.all(8.0),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 2,
                            top: SizeConfig.safeBlockHorizontal * 3,
                            right: SizeConfig.safeBlockHorizontal * 2,
                            bottom: SizeConfig.safeBlockHorizontal * 3),
                        child: Text(
                          "How to Buy",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeVertical * 2,
                            top: SizeConfig.blockSizeHorizontal * 30,
                            right: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeHorizontal * 70),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Hexcolor("#3DB83A"))),
                          color: Colors.white,
                          textColor: Hexcolor("#3DB83A"),
                          // padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 2,
                                top: SizeConfig.safeBlockHorizontal * 3,
                                right: SizeConfig.safeBlockHorizontal * 2,
                                bottom: SizeConfig.safeBlockHorizontal * 3),
                            child: Text(
                              "Hot Deals",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeVertical * 1,
                        top: SizeConfig.blockSizeHorizontal * 50,
                        right: SizeConfig.blockSizeVertical * 1,
                        bottom: SizeConfig.blockSizeHorizontal * 70),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Hexcolor("#3DB83A"))),
                      color: Colors.white,
                      textColor: Hexcolor("#3DB83A"),
                      // padding: EdgeInsets.all(8.0),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 2,
                            top: SizeConfig.safeBlockHorizontal * 3,
                            right: SizeConfig.safeBlockHorizontal * 2,
                            bottom: SizeConfig.safeBlockHorizontal * 3),
                        child: Text(
                          "How to Sell",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeVertical * 2,
                            top: SizeConfig.blockSizeHorizontal * 50,
                            right: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeHorizontal * 70),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Hexcolor("#3DB83A"))),
                          color: Colors.white,
                          textColor: Hexcolor("#3DB83A"),
                          // padding: EdgeInsets.all(5.0),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 5,
                                top: SizeConfig.safeBlockHorizontal * 3,
                                right: SizeConfig.safeBlockHorizontal * 5,
                                bottom: SizeConfig.safeBlockHorizontal * 3),
                            child: Text(
                              "Games",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      top: SizeConfig.safeBlockHorizontal * 70),
                  child: Text(
                    'CATEGORIES',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: pHeight * 0.020),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 70),
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Hexcolor("#3DB83A"),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: pHeight * 0.020),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.safeBlockHorizontal * 5,
                      top: SizeConfig.safeBlockHorizontal * 70),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Hexcolor("#3DB83A"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeVertical * 2,
                  top: SizeConfig.blockSizeHorizontal * 80,
                  right: SizeConfig.blockSizeVertical * 2,
                  bottom: SizeConfig.blockSizeHorizontal * 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: <Widget>[
                    Card(
                      child: new InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 15,
                          width: SizeConfig.blockSizeHorizontal * 35,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeVertical * 5,
                                top: SizeConfig.blockSizeHorizontal * 3,
                                right: SizeConfig.blockSizeVertical * 5,
                                bottom: SizeConfig.blockSizeHorizontal * 10),
                            child: Image.asset(
                              "assets/smartphone.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeVertical * 5,
                            top: SizeConfig.blockSizeHorizontal * 20,
                            right: SizeConfig.blockSizeVertical * 5,
                            bottom: SizeConfig.blockSizeHorizontal * 10),
                        child: Text(
                          "Mobile Phones",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    )
                  ]),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(children: <Widget>[
                          Card(
                            child: new InkWell(
                              onTap: () {
                                print("tapped");
                              },
                              child: Container(
                                height: SizeConfig.blockSizeVertical * 15,
                                width: SizeConfig.blockSizeHorizontal * 35,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeVertical * 5,
                                      top: SizeConfig.blockSizeHorizontal * 3,
                                      right: SizeConfig.blockSizeVertical * 5,
                                      bottom:
                                          SizeConfig.blockSizeHorizontal * 10),
                                  child: Image.asset(
                                    "assets/smartphone.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeVertical * 5,
                                  top: SizeConfig.blockSizeHorizontal * 20,
                                  right: SizeConfig.blockSizeVertical * 5,
                                  bottom: SizeConfig.blockSizeHorizontal * 10),
                              child: Text(
                                "Mobile Phones",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      top: SizeConfig.safeBlockHorizontal * 115),
                  child: Text(
                    'POPULAR PRODUCTS',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: pHeight * 0.020),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: pHeight * 0.0,
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeVertical * 0,
                        top: SizeConfig.blockSizeHorizontal * 125,
                        right: SizeConfig.blockSizeVertical * 0,
                        bottom: SizeConfig.blockSizeHorizontal * 10),
                    child: Container(
                      child: GridView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          children: <Widget>[
                            Stack(children: <Widget>[
                              Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen()),
                                    ),
                                    child: Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height:
                                                SizeConfig.blockSizeHorizontal *
                                                    25,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    35,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/watch.jpg'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              title: Padding(
                                                padding: EdgeInsets.only(
                                                    right: SizeConfig
                                                            .safeBlockHorizontal *
                                                        5,
                                                    bottom: SizeConfig
                                                            .safeBlockHorizontal *
                                                        0,
                                                    top: SizeConfig
                                                            .safeBlockHorizontal *
                                                        0),
                                                child: Text(
                                                  'Brand New Smart Watch',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Black Ops One'),
                                                ),
                                              ),
                                              subtitle: Padding(
                                                padding: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  bottom: SizeConfig
                                                          .safeBlockHorizontal *
                                                      2,
                                                ),
                                                child: Text(
                                                  "\₹${13000}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          Hexcolor("#3DB83A")),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .safeBlockHorizontal *
                                                      1,
                                                  bottom: SizeConfig
                                                          .safeBlockHorizontal *
                                                      6,
                                                ),
                                                child: IconButton(
                                                    color: Hexcolor("#3DB83A"),
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      size: 12,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ]),
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen()),
                                  ),
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeHorizontal *
                                                  25,
                                          width:
                                              SizeConfig.blockSizeVertical * 35,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage('assets/watch.jpg'),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Padding(
                                              padding: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  bottom: SizeConfig
                                                          .safeBlockHorizontal *
                                                      0,
                                                  top: SizeConfig
                                                          .safeBlockHorizontal *
                                                      0),
                                              child: Text(
                                                'Brand New Smart Watch',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Black Ops One'),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .safeBlockHorizontal *
                                                    5,
                                                bottom: SizeConfig
                                                        .safeBlockHorizontal *
                                                    2,
                                              ),
                                              child: Text(
                                                "\₹${13000}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Hexcolor("#3DB83A")),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .safeBlockHorizontal *
                                                    1,
                                                bottom: SizeConfig
                                                        .safeBlockHorizontal *
                                                    6,
                                              ),
                                              child: IconButton(
                                                  color: Hexcolor("#3DB83A"),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    size: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen()),
                                  ),
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeHorizontal *
                                                  25,
                                          width:
                                              SizeConfig.blockSizeVertical * 35,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage('assets/watch.jpg'),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Padding(
                                              padding: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  bottom: SizeConfig
                                                          .safeBlockHorizontal *
                                                      0,
                                                  top: SizeConfig
                                                          .safeBlockHorizontal *
                                                      0),
                                              child: Text(
                                                'Brand New Smart Watch',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Black Ops One'),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .safeBlockHorizontal *
                                                    5,
                                                bottom: SizeConfig
                                                        .safeBlockHorizontal *
                                                    2,
                                              ),
                                              child: Text(
                                                "\₹${13000}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Hexcolor("#3DB83A")),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .safeBlockHorizontal *
                                                    1,
                                                bottom: SizeConfig
                                                        .safeBlockHorizontal *
                                                    6,
                                              ),
                                              child: IconButton(
                                                  color: Hexcolor("#3DB83A"),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    size: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen()),
                                  ),
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeHorizontal *
                                                  25,
                                          width:
                                              SizeConfig.blockSizeVertical * 35,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage('assets/watch.jpg'),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Padding(
                                              padding: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  bottom: SizeConfig
                                                          .safeBlockHorizontal *
                                                      0,
                                                  top: SizeConfig
                                                          .safeBlockHorizontal *
                                                      0),
                                              child: Text(
                                                'Brand New Smart Watch',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Black Ops One'),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .safeBlockHorizontal *
                                                    5,
                                                bottom: SizeConfig
                                                        .safeBlockHorizontal *
                                                    2,
                                              ),
                                              child: Text(
                                                "\₹${13000}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Hexcolor("#3DB83A")),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .safeBlockHorizontal *
                                                    1,
                                                bottom: SizeConfig
                                                        .safeBlockHorizontal *
                                                    6,
                                              ),
                                              child: IconButton(
                                                  color: Hexcolor("#3DB83A"),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    size: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ]))),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
