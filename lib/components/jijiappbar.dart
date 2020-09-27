import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class JijiAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(80.0), // here the desired height
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Hexcolor("#3DB83A"),
        elevation: 0,
        // centerTitle: false,
        // titleSpacing: 0,
        title: Row(children: <Widget>[
          SizedBox(
            height: pHeight * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
            child: Text(
              "Jiji",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(
            height: pHeight * 0.1,
          ),
          Expanded(
            child: Container(
              width: 100.0,
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 0, 20),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 50.0),
                        child: Icon(Icons.search),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      hintText: "Search",
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ),
          )
        ]),

        actions: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 22, 20, 20),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
    ));
  }
}
