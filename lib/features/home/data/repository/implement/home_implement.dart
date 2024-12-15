import '/features/posts/data/model/post_model/post_model.dart';
import '/features/home/data/repository/home_repo.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeImplement extends HomeRepo {
  @override
  Future<Either<Failures, List<PostModel>>> fetchAllPosts({
    required String userId,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.posts}/$userId";
      final response = await dio.get(url);
      final session = (response.data["data"] as List)
          .map((data) => PostModel.fromJson(data))
          .toList();
      return right(session);
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
