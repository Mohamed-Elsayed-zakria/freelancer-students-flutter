import '/features/auth/data/models/user_session/user_session.dart';
import '/features/auth/data/repository/register_repo.dart';
import '/features/auth/data/models/register_model.dart';
import '/core/constant/api_end_point.dart';
import '/core/services/auth_services.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterImplement extends RegisterRepo {
  @override
  Future<Either<Failures, void>> register({
    required RegisterModel registerModel,
  }) async {
    try {
      const url = "${APIEndPoint.url}${APIEndPoint.singup}";
      final response = await dio.post(
        url,
        data: registerModel.toJson(),
      );
      final jsonData = response.data as Map<String, dynamic>;
      final session = UserSession.fromJson(jsonData);
      AuthServices.storeCredentials(
        session.convertToUserCredentials(),
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
