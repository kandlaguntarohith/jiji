class PostedBy {
  PostedBy({
    this.resetPasswordLink,
    this.role,
    this.photo,
    this.followers,
    this.following,
    this.likedPost,
    this.id,
    this.name,
    this.email,
    this.salt,
    this.hashedPassword,
    this.phone,
    this.street,
    this.city,
    this.pincode,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String resetPasswordLink;
  int role;
  String photo;
  List<dynamic> followers;
  List<dynamic> following;
  List<dynamic> likedPost;
  String id;
  String name;
  String email;
  String salt;
  String hashedPassword;
  int phone;
  String street;
  String city;
  int pincode;
  String state;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        resetPasswordLink: json["resetPasswordLink"] == null
            ? null
            : json["resetPasswordLink"],
        role: json["role"],
        photo: json["photo"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        likedPost: List<dynamic>.from(json["likedPost"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        salt: json["salt"],
        hashedPassword: json["hashed_password"],
        phone: json["phone"],
        street: json["street"],
        city: json["city"],
        pincode: json["pincode"],
        state: json["state"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "resetPasswordLink":
            resetPasswordLink == null ? null : resetPasswordLink,
        "role": role,
        "photo": photo,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "likedPost": List<dynamic>.from(likedPost.map((x) => x)),
        "_id": id,
        "name": name,
        "email": email,
        "salt": salt,
        "hashed_password": hashedPassword,
        "phone": phone,
        "street": street,
        "city": city,
        "pincode": pincode,
        "state": state,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
