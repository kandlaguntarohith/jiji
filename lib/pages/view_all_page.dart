import 'package:flutter/material.dart';
import 'package:jiji/pages/home_page.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';

class MyViewAllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
      ),
      body: GridView.count(
        primary: false,
        crossAxisSpacing: SizeConfig.deviceWidth,
        mainAxisSpacing: SizeConfig.deviceHeight,
        crossAxisCount: 2,
        children: <Widget>[
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
    );
  }
}
