import 'package:flutter/material.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/pages/product_details.dart';
import 'package:jiji/utilities/size_config.dart';

class SimilarProductCard extends StatelessWidget {
  final String productImgUrl;
  final String productName;
  final bool isFav;
  final double prices;
  final String place;

  const SimilarProductCard({
    Key key,
    @required this.productImgUrl,
    @required this.productName,
    @required this.isFav,
    @required this.prices,
    @required this.place,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Container(
                  height: constraints.maxHeight * 0.67,
                  width: double.infinity,
                  child: productImgUrl == ""
                      ? SizedBox
                      : Image.network(
                          productImgUrl,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: constraints.maxWidth * 0.05,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                          Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: MyThemeData.primaryColor,
                            size: constraints.maxWidth * 0.06,
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "₹ " + prices.toString(),
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.045,
                              color: MyThemeData.primaryColor,
                            ),
                          ),
                          Text(
                            place,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.045,
                              color: MyThemeData.inputPlaceHolder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
