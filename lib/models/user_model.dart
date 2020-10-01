import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final String uid;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String emailId;

  @HiveField(4)
  final int phone;

  @HiveField(5)
  final int role;

  UserModel({
    this.token,
    this.uid,
    this.name,
    this.emailId,
    this.phone,
    this.role,
  });
}
