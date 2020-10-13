import 'package:flutter/material.dart';
import 'package:jiji/models/categories_list.dart';
import 'package:jiji/models/category.dart';
import 'package:jiji/pages/home_page.dart';
import 'package:jiji/pages/sub_category_page.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:provider/provider.dart';

class MyViewAllPage extends StatelessWidget {
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    categories = Provider.of<Categories>(context).categoriesList;
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.deviceWidth * 4),
        child: GridView.builder(
          // primary: false,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeConfig.deviceWidth * 2,
            mainAxisSpacing: SizeConfig.deviceWidth * 3,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              label: categories[index].name,
              categoryId: categories[index].id,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SubCategoryScreen(
                    categoryId: categories[index].id,
                  ),
                ),
              ),
              subText: "(${categories[index].view} ads)",
            );
          },
          itemCount: categories.length,
          // itemCount: 4,
        ),
      ),
    );
  }
}
// children: categories
//           .map(
//             (category) =>
//           .toList(),
