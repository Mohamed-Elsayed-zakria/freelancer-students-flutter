import 'package:hive/hive.dart';
part 'user_credentials.g.dart';

@HiveType(typeId: 0)
class UserCredentials extends HiveObject {
  @HiveField(0)
  final String? username;
  @HiveField(1)
  final String? fullName;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? gender;
  @HiveField(5)
  final String? age;
  @HiveField(6)
  final bool? active;
  @HiveField(7)
  final String? id;
  @HiveField(8)
  String? personalPicture;
  @HiveField(9)
  String? token;
  @HiveField(10)
  final String? createdAt;
  @HiveField(11)
  final String? updatedAt;

  UserCredentials({
    this.username,
    this.fullName,
    this.slug,
    this.email,
    this.gender,
    this.age,
    this.active,
    this.id,
    this.personalPicture,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'fullName': fullName,
        'slug': slug,
        'email': email,
        'gender': gender,
        'age': age,
        'active': active,
        '_id': id,
        'personalPicture': personalPicture,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
