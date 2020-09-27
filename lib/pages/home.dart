import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/pages/product_details.dart';
import 'package:jiji/utilities/size_config.dart';

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
            preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.deviceWidth * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _selectedItem,
                          items: _dropdownMenuItems,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Hexcolor("#3DB83A"),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 2,
                  ),
                  HeaderText(
                    title: 'JIJI ASSIST',
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AssistButton(
                        onPressed: null,
                        label: "How to Buy",
                      ),
                      SizedBox(
                        width: SizeConfig.deviceWidth * 7.5,
                      ),
                      AssistButton(
                        onPressed: null,
                        label: "Hot Deals",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AssistButton(
                        onPressed: null,
                        label: "How to Sell",
                      ),
                      SizedBox(
                        width: SizeConfig.deviceWidth * 7.5,
                      ),
                      AssistButton(
                        onPressed: null,
                        label: "Games",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HeaderText(
                        title: 'CATEGORIES',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'View All',
                            style: TextStyle(
                                color: Hexcolor("#3DB83A"),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.deviceWidth * 3),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: SizeConfig.deviceWidth * 3,
                            color: Hexcolor("#3DB83A"),
                          ),
                          // Icon(
                          //   Icons.arrow_forward_ios,
                          //   size: SizeConfig.deviceWidth * 3,
                          //   color: Hexcolor("#3DB83A"),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryCard(
                        label: "Mobiles Phones",
                        onPressed: () {},
                        subText: "(12,400 ads)",
                      ),
                      CategoryCard(
                        label: "Mobiles Phones",
                        onPressed: () {},
                        subText: "(12,400 ads)",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 3,
                  ),
                  HeaderText(
                    title: 'POPULAR PRODUCTS',
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 2,
                  ),
                  Column(
                    children: [
                      Container(
                        child: GridView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            children: <Widget>[
                              ProductCard(
                                location: "Goa, India",
                                price: "1200",
                                productName: "Brand New Smart Watch",
                              ),
                              ProductCard(
                                location: "Goa, India",
                                price: "1200",
                                productName:
                                    "Brand New Smart Watch from United States of America",
                              ),
                              ProductCard(
                                location: "Goa, India",
                                price: "1200",
                                productName: "Brand New Smart Watch",
                              ),
                              ProductCard(
                                location: "Goa, India",
                                price: "1200",
                                productName: "Brand New Smart Watch",
                              ),
                              ProductCard(
                                location: "Goa, India",
                                price: "1200",
                                productName: "Brand New Smart Watch",
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class HeaderText extends StatelessWidget {
  String title;
  HeaderText({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.deviceWidth * 3),
    );
  }
}

class AssistButton extends StatelessWidget {
  String label;
  Function onPressed;

  AssistButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.deviceWidth * 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          border: Border.all(color: Hexcolor("#3DB83A"), width: 2)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.deviceHeight * 1.5),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: SizeConfig.deviceWidth * 4,
              color: Hexcolor("#3DB83A"),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  String label;
  String subText;
  Function onPressed;
  Image image;
  CategoryCard({
    this.label,
    this.onPressed,
    this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.deviceWidth * 1),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.deviceHeight * 2),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.deviceWidth * 15),
                  child: Image.asset("assets/smartphone.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 1),
                  child: Text(
                    label,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.deviceHeight * 1.35),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 0.5),
                  child: Text(
                    subText,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.deviceHeight * 1.00),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  String productName;
  String price;
  String location;

  ProductCard({this.price, this.location, this.productName});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool liked = false;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.deviceWidth * 2,
          vertical: SizeConfig.deviceHeight * 1),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductDetailScreen()),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 70,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/watch.jpg'),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.5,
                ),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.deviceWidth * 2,
                        right: SizeConfig.deviceWidth * 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${widget.productName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.deviceWidth * 2.75),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            color: Hexcolor("#3DB83A"),
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              size: SizeConfig.deviceWidth * 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.5,
                ),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.deviceWidth * 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ 12000',
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.deviceWidth * 2.15),
                        ),
                        Text(
                          'Goa, India',
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.deviceWidth * 2.15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.25,
                ),
              ],
            ),
          )),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
