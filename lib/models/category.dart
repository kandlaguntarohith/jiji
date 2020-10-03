import 'package:jiji/models/photo.dart';

class Category {
  Category({
    this.view,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.photo,
    this.subcategory,
  });

  int view;
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<Photo> photo;
  List<String> subcategory;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        view: json["view"],
        id: json["_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
        subcategory: json["Subcategory"] == null
            ? null
            : List<String>.from(json["Subcategory"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "view": view,
        "_id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
        "Subcategory": subcategory == null
            ? null
            : List<dynamic>.from(subcategory.map((x) => x)),
      };
}
