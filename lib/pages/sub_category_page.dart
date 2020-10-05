import 'package:flutter/material.dart';
import 'package:jiji/impl/impl.dart';
import 'package:jiji/models/sub_category.dart';
import 'package:jiji/pages/home_page.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';

class SubCategoryScreen extends StatefulWidget {
  final String categoryId;
  const SubCategoryScreen({
    Key key,
    this.categoryId,
  }) : super(key: key);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState(categoryId);
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  List<SubCategory> subCategories = [];
  final String categoryId;

  _SubCategoryScreenState(this.categoryId);

  void initState() {
    super.initState();
    getSubCategoriesList();
  }

  getSubCategoriesList() async {
    (await Impl().getSubCategoriesList()).forEach((element) {
      if (element.categoryId == categoryId) subCategories.add(element);
    });
    setState(() {});
  }

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
        children: subCategories
            .map(
              (subCategory) => CategoryCard(
                label: subCategory.name,
                categoryId: subCategory.id,
                onPressed: () {},
                subText: "(${subCategories[0].view} ads)",
              ),
            )
            .toList(),
      ),
    );
  }
}
