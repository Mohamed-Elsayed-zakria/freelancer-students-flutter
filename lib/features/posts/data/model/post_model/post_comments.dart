import 'user_data.dart';

class PostComments {
  final String? id;
  final String? postId;
  final UserData? userId;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const PostComments({
    this.id,
    this.postId,
    this.userId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PostComments.fromJson(Map<String, dynamic> json) => PostComments(
        id: json['_id'] as String?,
        postId: json['postId'] as String?,
        userId: json['userId'] == null
            ? null
            : UserData.fromJson(json['userId'] as Map<String, dynamic>),
        comment: json['comment'] as String?,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'postId': postId,
        'userId': userId?.toJson(),
        'comment': comment,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
