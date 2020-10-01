class User {
  User({
    this.name,
    this.email,
    this.password,
    this.password1,
    this.phone,
  });

  String name;
  String email;
  String password;
  String password1;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        password1: json["password1"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password1": password1,
        "phone": phone,
      };
}
