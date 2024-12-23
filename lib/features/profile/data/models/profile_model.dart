class ProfileModel {
  String username;
  String fullName;
  List listBlock;
  bool verified;
  List followers;
  List following;
  String personalPageUrl;
  String? coverPhoto;
  String personalPicture;
  String personalUid;
  String bio;

  ProfileModel({
    required this.username,
    required this.fullName,
    required this.personalPageUrl,
    required this.personalUid,
    required this.listBlock,
    required this.followers,
    required this.verified,
    required this.following,
    required this.coverPhoto,
    required this.personalPicture,
    required this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'],
      fullName: json['fullName'],
      personalUid: json['userId'],
      personalPageUrl: json['personalPageUrl'] ?? '',
      verified: json['verified'] ?? false,
      listBlock: json['listBlock'] ?? [],
      followers: json['followers'] ?? [],
      following: json['following'] ?? [],
      personalPicture: json['personalPicture'],
      coverPhoto: json['coverPhoto'],
      bio: json['bio'] ?? '--',
    );
  }
}
