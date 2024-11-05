import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepo extends BaseServices {
  Future<Either<Failures, void>> sendVerificationCode({
    required String email,
  });

  Future<Either<Failures, void>> verifyResetCode({
    required String email,
    required String pinCode,
  });

  Future<Either<Failures, void>> resetPassword({
    required String email,
    required String newPassword,
    required String passwordConfirmation,
  });
}
