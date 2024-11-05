import '/features/auth/data/models/user_session/user_session.dart';
import '/features/auth/data/repository/login_repo.dart';
import '/features/auth/data/models/login_model.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginImplement extends LoginRepo {
  @override
  Future<Either<Failures, UserSession>> login({
    required LoginModel loginModel,
  }) async {
    try {
      const url = "${APIEndPoint.url}${APIEndPoint.login}";
      final response = await dio.post(
        url,
        data: loginModel.toJson(),
      );
      final jsonData = response.data as Map<String, dynamic>;
      final session = UserSession.fromJson(jsonData);
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
