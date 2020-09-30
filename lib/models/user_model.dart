import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String photoUrl;

  @HiveField(4)
  final String emailId;

  @HiveField(5)
  final int phone;

  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.photoUrl,
    this.emailId,
    this.phone,
  });
}
