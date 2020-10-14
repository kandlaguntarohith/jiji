import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiji/models/product.dart';
import 'package:jiji/models/user_model.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/pages/product_details.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:provider/provider.dart';

class SimilarProductCard extends StatefulWidget {
  // final String productImgUrl;
  // final String productName;
  // final bool isFav;
  // final double prices;
  // final String place;
  final Product product;
  const SimilarProductCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  _SimilarProductCardState createState() => _SimilarProductCardState();
}

class _SimilarProductCardState extends State<SimilarProductCard> {
  bool isFav;
  Box<UserModel> _user;
  UserModel _userModel;
  bool _isFavourite(UserModel user) {
    List likedPost = widget.product.likes;
    bool isLiked = false;
    likedPost.forEach((element) {
      if (element == user.uid) {
        isLiked = true;
      }
    });
    return isLiked;
  }

  @override
  void initState() {
    _user = Provider.of<Box<UserModel>>(context, listen: false);
    _userModel = _user.values.first;
    isFav = _isFavourite(_userModel);
    super.initState();
  }

  toggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Box<UserModel> _user = Provider.of<Box<UserModel>>(context, listen: false);
    // UserModel _userModel = _user.values.first;
    // bool isFav = _isFavourite(_userModel);
    String img = widget.product.photo.length > 0
        ? "https://olx-app-jiji.herokuapp.com/api/post/photo/${widget.product.id}?photoId=${widget.product.photo[0].id}"
        : "";
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            product: widget.product,
            notifyParent: toggleFav,
          ),
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
                  child: img == ""
                      ? SizedBox()
                      : CachedNetworkImage(
                          filterQuality: FilterQuality.low,
                          imageUrl: img,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Center(
                              child: Text(
                                "Image \nNot \nAvailable !",
                                style: TextStyle(
                                  fontSize: 5,
                                  color: MyThemeData.inputPlaceHolder,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
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
                            widget.product.name,
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
                            "₹ " + widget.product.price.toString(),
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.045,
                              color: MyThemeData.primaryColor,
                            ),
                          ),
                          Text(
                            widget.product.city,
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
