import '/core/models/user_credentials.dart';
import 'data.dart';

class UserSession{
  final String? status;
  final Data? data;
  final String? token;

  const UserSession({this.status, this.data, this.token});

  factory UserSession.fromJson(Map<String, dynamic> json) => UserSession(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'token': token,
      };

  UserCredentials convertToUserCredentials() {
    return UserCredentials(
      username: data?.username,
      fullName: data?.fullName,
      slug: data?.slug,
      email: data?.email,
      gender: data?.gender,
      age: data?.age,
      active: data?.active,
      id: data?.id,
      personalPicture: data?.personalPicture,
      token: token,
      createdAt: data?.createdAt,
      updatedAt: data?.updatedAt,
    );
  }
}
