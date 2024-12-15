import 'user_data.dart';
import 'post_likes.dart';
import 'post_comments.dart';

class PostModel {
  final String? id;
  final UserData? userData;
  final String? description;
  final List<dynamic>? imagesUrl;
  final String? videoUrl;
  final String? postStatus;
  final String? createdAt;
  final String? updatedAt;
  final List<PostLikes>? postLikes;
  final List<PostComments>? postComments;

  const PostModel({
    this.id,
    this.userData,
    this.description,
    this.imagesUrl,
    this.videoUrl,
    this.postStatus,
    this.createdAt,
    this.updatedAt,
    this.postLikes,
    this.postComments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['_id'] as String?,
        userData: json['userId'] == null
            ? null
            : UserData.fromJson(json['userId'] as Map<String, dynamic>),
        description: json['description'] as String?,
        imagesUrl: json['imagesUrl'] as List<dynamic>?,
        videoUrl: json['videoUrl'] as String?,
        postStatus: json['postStatus'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        postLikes: (json['likes'] as List<dynamic>?)
            ?.map((e) => PostLikes.fromJson(e as Map<String, dynamic>))
            .toList(),
        postComments: (json['comments'] as List<dynamic>?)
            ?.map((e) => PostComments.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userData?.toJson(),
        'description': description,
        'imagesUrl': imagesUrl,
        'videoUrl': videoUrl,
        'postStatus': postStatus,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'likes': postLikes?.map((e) => e.toJson()).toList(),
        'comments': postComments?.map((e) => e.toJson()).toList(),
      };
}
