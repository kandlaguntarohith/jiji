import 'package:flutter/material.dart';

import 'similar_product_card.dart';

class SimilarProducts extends StatelessWidget {
  final List<String> productImgUrl;
  final List<String> productName;
  final List<bool> isFav;
  final List<double> prices;
  final List<String> place;

  const SimilarProducts({
    Key key,
    @required this.productImgUrl,
    @required this.productName,
    @required this.isFav,
    @required this.prices,
    @required this.place,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 157 / 140,
      ),
      itemBuilder: (_, index) => SimilarProductCard(
        productImgUrl: productImgUrl[index],
        productName: productName[index],
        isFav: isFav[index],
        prices: prices[index],
        place: place[index],
      ),
      itemCount: productImgUrl.length,
    );
  }
}
