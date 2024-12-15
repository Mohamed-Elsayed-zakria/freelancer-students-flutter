import '/features/posts/data/model/add_post_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AddPostRepo extends BaseServices{
  Future<Either<Failures, List<String>>> uploadImageFromDevice();
  Future<Either<Failures, void>> createNewPost({
    required AddPostModel postDataModel,
  });
}
