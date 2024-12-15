import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class AddPostModel {
  final String description;
  final List<String> imagesUrl;
  final String personUid;
  final String postStatus;

  AddPostModel({
    required this.description,
    required this.imagesUrl,
    required this.personUid,
    required this.postStatus,
  });

  FormData toFormData() {
    String generatId = const Uuid().v1();

    final List<MultipartFile> images = imagesUrl
        .map((image) =>
            MultipartFile.fromFileSync(image, filename: "$generatId.jpg"))
        .toList();
    return FormData.fromMap({
      "description": description,
      "postStatus": postStatus,
      "imagesUrl": images,
    });
  }
}
