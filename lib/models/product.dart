import 'package:jiji/models/photo.dart';
import 'package:jiji/models/posted_by.dart';

class Product {
  Product({
    this.views,
    this.likes,
    this.id,
    this.name,
    this.description,
    this.price,
    this.postedBy,
    this.title,
    this.condition,
    this.city,
    this.category,
    this.subCategory,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int views;
  List<dynamic> likes;
  String id;
  String name;
  String description;
  String price;
  PostedBy postedBy;
  String title;
  String condition;
  String city;
  String category;
  String subCategory;
  List<Photo> photo;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        views: json["views"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        postedBy: PostedBy.fromJson(json["postedBy"]),
        title: json["title"],
        condition: json["condition"],
        city: json["city"],
        category: json["category"],
        subCategory: json["subCategory"],
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "views": views,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "postedBy": postedBy.toJson(),
        "title": title,
        "condition": condition,
        "city": city,
        "category": category,
        "subCategory": subCategory,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
