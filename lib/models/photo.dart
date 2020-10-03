class Photo {
  Photo({
    this.id,
    this.contentType,
  });

  String id;
  String contentType;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["_id"],
        contentType: json["contentType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "contentType": contentType,
      };
}
