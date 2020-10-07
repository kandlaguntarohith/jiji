import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:jiji/constants/endpoints.dart';
import 'package:jiji/data/network/api_helper.dart';
import 'package:jiji/models/UserProfile.dart';
import 'package:jiji/models/user_model.dart';
import 'package:jiji/pages/add_product_screen.dart';
import 'package:jiji/pages/chat_page.dart';
import 'package:jiji/pages/home_page.dart';
import 'package:jiji/pages/my_ads_page.dart';
import 'package:jiji/pages/profile_page.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  UserProfile userProfile;
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    ChatPage(),
    AddProductScreen(),
    MyAdsPage(),
    ProfilePage()
  ]; // to store nested tabs
  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage(); // Our first view in viewport
  getUserProfile() async {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(
      context,
      listen: false,
    );
    final UserModel _userModel = _userBox.values.first;
    // print("name : " + _userModel.name);
    userProfile = UserProfile.fromJson(
      await ApiHelper().get("${Endpoints.getUserProfile}/${_userModel.uid}"),
    );
    setState(() {});
    // print(userProfile.name);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProfile>(
      create: (context) => userProfile,
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                          currentScreen = HomePage();
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.dashboard_outlined,
                            color: currentTab == 0
                                ? Hexcolor("#3DB83A")
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                      currentScreen = ChatPage();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.chat_outlined,
                        color:
                            currentTab == 1 ? Hexcolor("#3DB83A") : Colors.grey,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                      currentScreen = AddProductScreen();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_box_outlined,
                        color:
                            currentTab == 2 ? Hexcolor("#3DB83A") : Colors.grey,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 3;
                      currentScreen = MyAdsPage();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.show_chart_outlined,
                        color:
                            currentTab == 3 ? Hexcolor("#3DB83A") : Colors.grey,
                      ),
                    ],
                  ),
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 4;
                          currentScreen = ProfilePage();
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_outline,
                            color: currentTab == 4
                                ? Hexcolor("#3DB83A")
                                : Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
