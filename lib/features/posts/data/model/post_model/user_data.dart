class UserData {
  final bool? verified;
  final String? id;
  final String? username;
  final String? fullName;
  final String? slug;
  final String? email;
  final String? gender;
  final String? role;
  final String? age;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final String? personalPicture;

  const UserData({
    this.verified,
    this.id,
    this.username,
    this.fullName,
    this.slug,
    this.email,
    this.gender,
    this.role,
    this.age,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.personalPicture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        verified: json['verified'] as bool?,
        id: json['_id'] as String?,
        username: json['username'] as String?,
        fullName: json['fullName'] as String?,
        slug: json['slug'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        role: json['role'] as String?,
        age: json['age'] as String?,
        active: json['active'] as bool?,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        personalPicture: json['personalPicture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'verified': verified,
        '_id': id,
        'username': username,
        'fullName': fullName,
        'slug': slug,
        'email': email,
        'gender': gender,
        'role': role,
        'age': age,
        'active': active,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'personalPicture': personalPicture,
      };
}
