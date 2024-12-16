import '/features/profile/data/repository/profile_repo.dart';
import '/features/profile/data/models/profile_model.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileImplement extends ProfileRepo {
  @override
  Future<Either<Failures, ProfileModel>> getUserProfileData({
    required String userId,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.profile}/$userId";
      final response = await dio.get(url);
      final jsonData = response.data as Map<String, dynamic>;
      final session = ProfileModel.fromJson(jsonData);
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
