class ProfileModel {
  String username;
  String fullName;
  List listBlock;
  bool verified;
  List followers;
  List following;
  String personalPageUrl;
  String coverPhoto;
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
      personalPicture: json['personalPicture'] ??
          "https://firebasestorage.googleapis.com/v0/b/social-frinds.appspot.com/o/default-profile-pictures%2Fmale.png?alt=media&token=9785f3a6-61d8-4a6c-9079-5effbe0eff8a",
      coverPhoto: json['coverPhoto'] ??
          "https://firebasestorage.googleapis.com/v0/b/social-frinds.appspot.com/o/defulte-cover%2Fcover.jpg?alt=media&token=cfed2d09-7e9b-4f9f-855f-ec0df1344d71",
      bio: json['bio'] ?? '--',
    );
  }
}
