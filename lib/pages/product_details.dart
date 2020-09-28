import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiji/utilities/size_config.dart';

import '../ThemeData.dart';
import '../components/jijiappbar.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/product_images.dart';
import 'Widgets/seller_card.dart';
import 'Widgets/similar_products_list.dart';

List<String> pics = [
  "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=989&q=80",
  "https://images.unsplash.com/photo-1508057198894-247b23fe5ade?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
  "https://www.sonatawatches.in/wps/wcm/connect/sonata/042cae70-4810-4a93-a996-4106c12f55b7/728x524-nxt.jpg?MOD=AJPERES&CACHEID=ROOTWORKSPACE.Z18_90IA1H80O04180QIVM4BVG00L3-042cae70-4810-4a93-a996-4106c12f55b7-mZlHd0u",
  "https://assets.victorinox.com/medias/?context=bWFzdGVyfHRpbXw4MzgyM3xpbWFnZS9qcGVnfHRpbS9oZjYvaDJkLzEwMjYyMzk5NDE4Mzk4LmpwZ3w5NzRlMmIzYTQ3MDY3NWUwNWYyYzY3ZmEwOWEwNzE2ZDE4YzYzY2VlY2UzN2ZkZWI4YjUxNTZiNjFlNDBlMWEy",
  "https://www.wareable.com/media/imager/202002/34779-original.jpg",
  "https://www.hihonor.com/content/dam/honor/global/products/wearable/honor-magic-watch2-46mm/MagicWatch-2-46mm-facebookimg.jpg",
  "https://casiocdn.com/casio-v2/resource/temp/images/Artwork-home/mdv106-mobile-banner.jpg",
];

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

  List<String> img = pics;
  @override
  void initState() {
    isFavourite = true;
    // for (int i = 0; i < 7; i++) img.add(imgUrl);
    for (int i = 0; i < 4; i++) {
      productImgUrl.add(pics[i]);
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
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        (SizeConfig.deviceWidth * 100) - (2 * deviceHorizontalPadding);
    final textSize = availableWidthSpace * 0.045;
    const imageAspectRatio = 335 / 190;
    const callMessageButtonsAspectRatio = 9 / 1;
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color.fromRGBO(240, 240, 240, 1),
              height: SizeConfig.deviceHeight * 3,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Electronics",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                    ),
                  ),
                  Text(
                    " > ",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                      color: MyThemeData.primaryColor,
                    ),
                  ),
                  Text(
                    "Wearables",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                    ),
                  ),
                  Text(
                    " > ",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                      color: MyThemeData.primaryColor,
                    ),
                  ),
                  Text(
                    "SmartWatches",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                    ),
                  ),
                  Text(
                    " > ",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                      color: MyThemeData.primaryColor,
                    ),
                  ),
                  Text(
                    "Brand New...",
                    style: TextStyle(
                      fontSize: textSize * 0.6,
                      color: MyThemeData.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.deviceHeight * 2),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.deviceWidth * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: imageAspectRatio,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(img[selectedImageIndex]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 2),
                  ProductImages(
                    img: img,
                    selectedImageIndex: selectedImageIndex,
                    updateSelectedImage: updateSelectedImage,
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 3),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Brand New Smart Watch",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: textSize,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ 13,000",
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                          color: MyThemeData.primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => toggleFavourite(),
                        child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: MyThemeData.primaryColor,
                          size: textSize * 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 2),
                  SellerCard(),
                  SizedBox(height: SizeConfig.deviceHeight * 3),
                  AspectRatio(
                    aspectRatio: callMessageButtonsAspectRatio,
                    child: Row(
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
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 4),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ITEM DESCRIPTION",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: textSize * 0.7,
                        color: MyThemeData.inputPlaceHolder,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: textSize * 0.75,
                        color: Color.fromRGBO(58, 58, 58, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 4),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "SIMILAR PRODUCTS",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: textSize * 0.7,
                        color: MyThemeData.inputPlaceHolder,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 3),
                  SimilarProducts(
                    productImgUrl: productImgUrl,
                    productName: productName,
                    isFav: isFav,
                    prices: prices,
                    place: place,
                  ),
                  SizedBox(height: SizeConfig.deviceHeight * 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
