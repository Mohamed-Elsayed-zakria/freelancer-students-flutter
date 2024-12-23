import 'package:freelancer/core/constant/default_personal_images.dart';

import 'enum/register_gender.dart';

class RegisterModel {
  final String username;
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String age;

  const RegisterModel({
    required this.username,
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'fullName': fullName,
      'email': email,
      'password': password,
      'passwordConfirmation': confirmPassword,
      'gender': gender,
      'age': age,
      'personalPicture': gender == RegisterGender.male.name
          ? DefaultPersonalImage.urlPhotoMale
          : DefaultPersonalImage.urlPhotoFemale,
      'coverPhoto': DefaultPersonalImage.urlCoverPhoto,
    };
  }
}
