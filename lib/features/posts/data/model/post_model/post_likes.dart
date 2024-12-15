import 'user_data.dart';

class PostLikes {
  final String? id;
  final String? postId;
  final UserData? userId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const PostLikes({
    this.id,
    this.postId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PostLikes.fromJson(Map<String, dynamic> json) => PostLikes(
        id: json['_id'] as String?,
        postId: json['postId'] as String?,
        userId: json['userId'] == null
            ? null
            : UserData.fromJson(json['userId'] as Map<String, dynamic>),
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'postId': postId,
        'userId': userId?.toJson(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
