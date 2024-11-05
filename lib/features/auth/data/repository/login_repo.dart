import '/features/auth/data/models/user_session/user_session.dart';
import '/features/auth/data/models/login_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo extends BaseServices {
  Future<Either<Failures, UserSession>> login({
    required LoginModel loginModel,
  });
}
