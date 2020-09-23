import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/jijiappbar.dart';

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
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 10, 0, 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                padding: const EdgeInsets.fromLTRB(25, 60, 0, 0),
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
                  padding: const EdgeInsets.fromLTRB(15, 90, 10, 0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Hexcolor("#3DB83A"))),
                    color: Colors.white,
                    textColor: Hexcolor("#3DB83A"),
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
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
                      padding: const EdgeInsets.fromLTRB(0, 90, 20, 0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Hexcolor("#3DB83A"))),
                        color: Colors.white,
                        textColor: Hexcolor("#3DB83A"),
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 160, 10, 0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Hexcolor("#3DB83A"))),
                    color: Colors.white,
                    textColor: Hexcolor("#3DB83A"),
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 160, 27, 0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Hexcolor("#3DB83A"))),
                        color: Colors.white,
                        textColor: Hexcolor("#3DB83A"),
                        padding: EdgeInsets.all(5.0),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(42, 8, 42, 8),
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
                padding: const EdgeInsets.fromLTRB(25, 240, 0, 0),
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
                padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),
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
                padding: const EdgeInsets.fromLTRB(0, 240, 10, 0),
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
            padding: const EdgeInsets.fromLTRB(25, 280, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: new InkWell(
                    onTap: () {
                      print("tapped");
                    },
                    child: Container(
                      width: 160.0,
                      height: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
                        child: Image.asset(
                          "assets/smartphone.png",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          child: new InkWell(
                            onTap: () {
                              print("tapped");
                            },
                            child: Container(
                              width: 160.0,
                              height: 100.0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 40),
                                child: Image.asset(
                                  "assets/smartphone.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                padding: const EdgeInsets.fromLTRB(25, 420, 0, 0),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 450, 10, 0),
                child: Container(
                  child: GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: <Widget>[
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: (MediaQuery.of(context).size.width /
                                            2) -
                                        90,
                                    width: double.infinity,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/watch.jpg'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          150, 10, 0, 0),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 15,
                                        color: Hexcolor("#3DB83A"),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        'Brand New Smart Watch',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Black Ops One'),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: Text(
                                        "\₹${13000}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Hexcolor("#3DB83A")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              // onTap: () =>
                              // Navigator.of(context).pushNamed(MyHomePage2.routeName),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: (MediaQuery.of(context).size.width /
                                            2) -
                                        90,
                                    width: double.infinity,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/watch.jpg'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          150, 10, 0, 0),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 15,
                                        color: Hexcolor("#3DB83A"),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        'Brand New Smart Watch',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Black Ops One'),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: Text(
                                        "\₹${13000}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Hexcolor("#3DB83A")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              // onTap: () =>
                              // Navigator.of(context).pushNamed(MyHomePage2.routeName),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: (MediaQuery.of(context).size.width /
                                            2) -
                                        90,
                                    width: double.infinity,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/watch.jpg'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          150, 10, 0, 0),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 15,
                                        color: Hexcolor("#3DB83A"),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        'Brand New Smart Watch',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Black Ops One'),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: Text(
                                        "\₹${13000}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Hexcolor("#3DB83A")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              // onTap: () =>
                              // Navigator.of(context).pushNamed(MyHomePage2.routeName),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: (MediaQuery.of(context).size.width /
                                            2) -
                                        90,
                                    width: double.infinity,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/watch.jpg'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          150, 10, 0, 0),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 15,
                                        color: Hexcolor("#3DB83A"),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        'Brand New Smart Watch',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Black Ops One'),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: Text(
                                        "\₹${13000}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Hexcolor("#3DB83A")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ]),
                ),
              ),
            ],
          ),
        ])));
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
