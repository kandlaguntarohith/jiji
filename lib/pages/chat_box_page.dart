import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiji/controllers/chat/dmController.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ChatBoxPage extends StatefulWidget {
  final String recId;
  final String name;
  ChatBoxPage({this.recId, this.name});

  @override
  _ChatBoxPageState createState() => _ChatBoxPageState();
}

class _ChatBoxPageState extends State<ChatBoxPage> {
  // ScrollController _scrollController = ScrollController();
  final DmController _dmController = Get.put(DmController());
  Timer timer;
  @override
  void initState() {
    super.initState();
    _dmController.loadDetails(widget.recId);
    _dmController.scroll = ScrollController();
    _dmController.msgController = TextEditingController();
    timer = Timer.periodic(Duration(seconds: 15),
        (Timer t) => _dmController.getHistory(widget.recId, true));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        // resizeToAvoidBottomInset: false,
        // floatingActionButton: ,
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: PreferredSize(
          child: JijiAppBar(),
          preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.deviceHeight * 12,
              color: Hexcolor("#F0F0F0"),
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.deviceWidth * 7),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: SizeConfig.deviceWidth * 5,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.deviceWidth * 5,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                      radius: SizeConfig.deviceWidth * 7.5,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.deviceWidth * 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.deviceHeight * 2.5),
                          ),
                          SizedBox(
                            height: SizeConfig.deviceHeight * 1,
                          ),
                          Text(
                            'online',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.deviceHeight * 1.5),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.deviceHeight * 0.5,
            ),
            Obx(
              () => Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                    controller: _dmController.scroll,
                    shrinkWrap: true,
                    itemCount: _dmController.chatData == null
                        ? 0
                        : _dmController.chatData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MessageWidget(
                        message: _dmController.chatData[index]['body'],
                        time: DateFormat.Hm().format(
                          DateTime.fromMillisecondsSinceEpoch(
                            int.parse(_dmController.chatData[index]['date']),
                          ),
                        ),
                        clientMessage: _dmController.uid.value ==
                                _dmController.chatData[index]['from']
                            ? true
                            : false,
                      );
                    },
                  ),
                ),
              ),
            ),
            Obx(
              () => _dmController.typingDone.value
                  ? SizedBox()
                  : MessageWidget(
                      message: _dmController.newMsg.value,
                      clientMessage: true,
                      time: '',
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              // padding:
              //     EdgeInsets.symmetric(horizontal: SizeConfig.deviceWidth * 5),
              child: sendMessageWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget sendMessageWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        height: SizeConfig.deviceHeight * 6,
        decoration: BoxDecoration(
            color: Hexcolor("#F0F0F0"),
            borderRadius: BorderRadius.circular(SizeConfig.deviceWidth * 7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: SizeConfig.deviceWidth * 2,
                ),
                Container(
                  width: SizeConfig.deviceWidth * 70,
                  child: TextField(
                    onTap: () {
                      Timer(
                        Duration(milliseconds: 500),
                        () => _dmController.scroll.jumpTo(
                            _dmController.scroll.position.maxScrollExtent),
                      );
                    },
                    controller: _dmController.msgController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        icon: Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                          size: SizeConfig.deviceWidth * 5,
                        ),
                        hintText: "Enter Message",
                        fillColor: Colors.grey),
                  ),
                )
              ],
            ),
            CircleAvatar(
              radius: SizeConfig.deviceWidth * 5,
              backgroundColor: Hexcolor("3DB83A"),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: SizeConfig.deviceWidth * 5,
                ),
                onPressed: () {
                  if (_dmController.msgController.text != '') {
                    _dmController.newMsg.value =
                        _dmController.msgController.text;
                    _dmController.personalChat(
                      _dmController.msgController.text,
                      widget.recId,
                    );
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final bool clientMessage;
  final String time;
  final String message;

  MessageWidget({this.clientMessage, this.time, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.deviceWidth * 5,
          vertical: SizeConfig.deviceHeight * 1),
      child: Column(
        crossAxisAlignment:
            clientMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                clientMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        clientMessage ? Hexcolor("3DB83A") : Hexcolor("F0F0F0"),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.deviceWidth * 3),
                    child: Text(
                      message,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: clientMessage ? Colors.white : Colors.black),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.deviceHeight * 0.75),
            child: Text(
              time,
              style: TextStyle(
                  color: MyThemeData.inputPlaceHolder.withOpacity(0.5),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.deviceHeight * 1),
            ),
          )
        ],
      ),
    );
  }
}
