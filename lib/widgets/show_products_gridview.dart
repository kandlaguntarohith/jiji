import 'package:flutter/material.dart';
import 'package:jiji/models/product.dart';

import 'similar_product_card.dart';

class ShowProductsGridView extends StatelessWidget {
  final List<Product> products;

  const ShowProductsGridView({
    Key key,
    this.products,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (_, index) {
        String img = products[index].photo.length > 0
            ? "https://olx-app-jiji.herokuapp.com/api/category/photo/${products[index].photo[0]}.id?photoId=$products[index].photo[0].id"
            : "";
        return SimilarProductCard(
          productImgUrl: img,
          productName: products[index].name,
          isFav: true,
          prices: double.parse(products[index].price),
          place: products[index].city,
        );
      },
      itemCount: products.length,
      // itemCount: 4,
    );
  }
}
