class Data {
  final String? username;
  final String? fullName;
  final String? slug;
  final String? email;
  final String? gender;
  final String? age;
  final bool? active;
  final String? id;
  final String? personalPicture;
  final String? createdAt;
  final String? updatedAt;

  const Data({
    this.username,
    this.fullName,
    this.slug,
    this.email,
    this.gender,
    this.age,
    this.active,
    this.id,
    this.personalPicture,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json['username'] as String?,
        fullName: json['fullName'] as String?,
        slug: json['slug'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        age: json['age'] as String?,
        active: json['active'] as bool?,
        id: json['_id'] as String?,
        personalPicture: json['personalPicture'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

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
