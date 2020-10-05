class SubCategory {
  SubCategory({
    this.view,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.v,
  });

  int view;
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryId;
  int v;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        view: json["view"],
        id: json["_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryId: json["Category"]["_id"],
        v: json["__v"],
      );

  // Map<String, dynamic> toJson() => {
  //       "view": view,
  //       "_id": id,
  //       "name": name,
  //       "createdAt": createdAt.toIso8601String(),
  //       "updatedAt": updatedAt.toIso8601String(),
  //       "CategoryId": category.toJson(),
  //       "__v": v,
  //     };
}
