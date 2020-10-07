import 'package:flutter/material.dart';
import 'package:jiji/impl/impl.dart';
import 'package:jiji/models/product.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:jiji/widgets/show_products_gridview.dart';

class ShowSelectedSubCategoryProducts extends StatefulWidget {
  final String subCategoryId;

  const ShowSelectedSubCategoryProducts({Key key, this.subCategoryId})
      : super(key: key);
  @override
  _ShowSelectedSubCategoryProductsState createState() =>
      _ShowSelectedSubCategoryProductsState(subCategoryId);
}

class _ShowSelectedSubCategoryProductsState
    extends State<ShowSelectedSubCategoryProducts> {
  final String subCategoryId;
  List<Product> products = [];
  bool isLoaded = false;

  _ShowSelectedSubCategoryProductsState(this.subCategoryId);

  void initState() {
    super.initState();
    getSubCategoriesList();
  }

  getSubCategoriesList() async {
    // print(subCategories.length);
    final data = await Impl().getPopularProductsList();
    data.forEach((element) {
      if (element.subCategory == subCategoryId) products.add(element);
    });
    // print(subCategories.length);
    setState(() {
      isLoaded = true;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
      ),
      body: products.length > 0 || !isLoaded
          ? ShowProductsGridView(
              products: products,
            )
          : Center(
              child: Text("No Products available !"),
            ),
    );
  }
}
