
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiji/impl/impl.dart';
import 'package:jiji/models/product.dart';
import 'package:jiji/models/user_model.dart';
import 'package:provider/provider.dart';

class IsFav extends ChangeNotifier{
  IsFav({@required this.product, @required this.user});
  Product product;
  UserModel user;
  bool isFavourite = false;
  List likes;
  bool  _isFavourite  (){
    likes = product.likes;
    bool isFav = false;
    likes.forEach((element) {
      print("id : " + element);
      if (element.toString().trim() == user.uid.trim()) {
        isFav = true;
      }
    });
    return isFav;
  }

  bool get isFav {
    isFavourite = _isFavourite();
    return isFavourite;
  }

  void toggleFavourite(UserModel user, bool isFavourite) async {
    

    Map<String, String> header = {'Authorization': "Bearer ${user.token}"};

    Map<String, dynamic> body = {'postId': product.id};

    dynamic _response;

    if (!isFavourite) {
      _response = await Impl().putUnlike(header, body, user.uid);
      print(_response);
      // int index = likes.indexOf(user.uid);
      // likes.removeAt(index);
      isFavourite = !isFavourite;
      notifyListeners();

    } else {
      _response = await Impl().putLike(header, body, user.uid);
      // likes.add(user.uid);
      isFavourite = !isFavourite;
      print(" res $_response");
      notifyListeners();

    }
  }
}