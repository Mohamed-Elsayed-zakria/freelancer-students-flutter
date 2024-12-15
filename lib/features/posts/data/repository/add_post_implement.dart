import '/features/posts/data/model/add_post_model.dart';
import 'package:image_picker/image_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'add_post_repo.dart';

class AddPostImplement extends AddPostRepo {
  @override
  Future<Either<Failures, List<String>>> uploadImageFromDevice() async {
    List<String> imagePaths = [];
    try {
      final picker = ImagePicker();
      final pickedImages = await picker.pickMultiImage();
      if (pickedImages.isNotEmpty) {
        for (var image in pickedImages) {
          imagePaths.add(image.path);
        }
      }
      return right(imagePaths);
    } catch (e) {
      return left(PickImageFailures.errorType(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> createNewPost({
    required AddPostModel postDataModel,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.posts}/${postDataModel.personUid}";
      await dio.post(
        url,
        data: postDataModel.toFormData(),
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailures.fromDioError(dioError: e),
        );
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
    }
  }
}
