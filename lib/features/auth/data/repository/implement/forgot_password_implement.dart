import '/features/auth/data/repository/forgot_password_repo.dart';
import '/core/constant/api_end_point.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgotPasswordImplement extends ForgotPasswordRepo {
  @override
  Future<Either<Failures, void>> sendVerificationCode({
    required String email,
  }) async {
    try {
      const url = "${APIEndPoint.url}${APIEndPoint.sendVerificationCode}";
      final response = await dio.post(
        url,
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200) {
        return right(null);
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
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

  @override
  Future<Either<Failures, void>> verifyResetCode({
    required String email,
    required String pinCode,
  }) async {
    try {
      const url = "${APIEndPoint.url}${APIEndPoint.verifyResetCode}";
      final response = await dio.post(
        url,
        data: {"email": email, "pinCode": pinCode},
      );
      if (response.statusCode == 200) {
        return right(null);
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
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

  @override
  Future<Either<Failures, void>> resetPassword({
    required String email,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    try {
      const url = "${APIEndPoint.url}${APIEndPoint.resetPassword}";
      final response = await dio.post(
        url,
        data: {
          "email": email,
          "newPassword": newPassword,
          "passwordConfirmation": passwordConfirmation
        },
      );
      if (response.statusCode == 200) {
        return right(null);
      }
      return left(
        ServerFailures(errMessage: 'Something went wrong'),
      );
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
