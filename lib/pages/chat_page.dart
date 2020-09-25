import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/components/jijiappbar.dart';
import 'package:jiji/utilities/size_config.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: JijiAppBar(),
          preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 12.5),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            unreadChatsCounterWidget(),
            SizedBox(
              height: SizeConfig.deviceHeight * 2.5,
            ),
            ChatList()
          ],
        ),
      ),
    );
  }

  Widget unreadChatsCounterWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.deviceWidth * 5,
          vertical: SizeConfig.deviceHeight * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'CHATS',
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.deviceHeight * 1.5),
          ),
          ChatCounter()
        ],
      ),
    );
  }
}

class ChatCounter extends StatelessWidget {
  const ChatCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Hexcolor("#3DB83A"),
      child: Text(
        "5",
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.deviceWidth * 2.5,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
      radius: SizeConfig.deviceWidth * 3,
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ChatTile(),
      ],
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Hexcolor("#F0F0F0"))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.deviceHeight * 2,
            horizontal: SizeConfig.deviceWidth * 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 2.5),
              child: CircleAvatar(
                radius: SizeConfig.deviceWidth * 7.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.deviceWidth * 7.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amy James',
                    style: TextStyle(
                      color: Hexcolor("#3A3A3A"),
                      fontSize: SizeConfig.deviceWidth * 3.5,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.deviceHeight * 1,
                  ),
                  Text(
                    'Hi I am reaching out regarding',
                    style: TextStyle(
                      color: Hexcolor("#A3A3A3"),
                      fontSize: SizeConfig.deviceWidth * 3,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ChatCounter()
          ],
        ),
      ),
    );
  }
}
