import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiji/utilities/size_config.dart';

import '../ThemeData.dart';
import '../components/jijiappbar.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/product_images.dart';
import 'Widgets/seller_card.dart';
import 'Widgets/similar_products_list.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedImageIndex = 0;

  List<String> productImgUrl = [];

  List<String> productName = [];

  List<bool> isFav = [];

  List<double> prices = [];
  bool isFavourite = false;
  List<String> place = [];

  String description =
      "Esse est omnis nihil dolorem quas veniam nobis et. In ut deserunt culpa. Deleniti dolorem autem quo exercitationem itaque velit similique. Vero enim voluptate harum.Totam quas fuga aspernatur dolores necessitatibus dolor est. Molestiae ipsum rerum labore non nesciunt. Quia ipsam pariatur hic totam. Cumque ex in quod quis aliquam omnis.";

  String imgUrl =
      "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=989&q=80";

  List<String> img = [];
  @override
  void initState() {
    isFavourite = true;
    for (int i = 0; i < 7; i++) img.add(imgUrl);
    for (int i = 0; i < 4; i++) {
      productImgUrl.add(
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=989&q=80");
      productName.add("Brand New SmartWatch");
      isFav.add(i % 2 == 0);
      prices.add(i * 1000.0);
      place.add("Goa, India");
    }
    super.initState();
  }

  void updateSelectedImage(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(SizeConfig.deviceHeight * 10),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              color: Color.fromRGBO(240, 240, 240, 1),
              height: 30,
              width: double.infinity,
              child: Text(
                "Electronics > Wearables > Smart Watch > Brand new ....",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(img[selectedImageIndex]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 10),
                  ProductImages(
                    img: img,
                    selectedImageIndex: selectedImageIndex,
                    updateSelectedImage: updateSelectedImage,
                  ),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text(
                      "Brand New Smart Watch",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "13,000",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: MyThemeData.primaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => toggleFavourite(),
                          child: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: MyThemeData.primaryColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 11),
                  SellerCard(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        text: 'CALL',
                        isBorder: false,
                        color: MyThemeData.primaryColor,
                      ),
                      CustomButton(
                        icon: Icon(
                          Icons.message,
                          color: MyThemeData.primaryColor,
                        ),
                        isBorder: true,
                        text: 'CHAT',
                        color: MyThemeData.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ITEM DESCRIPTION",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: MyThemeData.inputPlaceHolder,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(58, 58, 58, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "SIMILAR PRODUCTS",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: MyThemeData.inputPlaceHolder,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SimilarProducts(
                    productImgUrl: productImgUrl,
                    productName: productName,
                    isFav: isFav,
                    prices: prices,
                    place: place,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
