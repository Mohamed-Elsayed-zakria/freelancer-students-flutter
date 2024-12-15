import '/features/posts/data/model/post_model/post_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo extends BaseServices {
  Future<Either<Failures, List<PostModel>>> fetchAllPosts({
    required String userId,
  });
}
