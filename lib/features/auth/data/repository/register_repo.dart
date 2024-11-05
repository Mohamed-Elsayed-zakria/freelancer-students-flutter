import '/features/auth/data/models/register_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo extends BaseServices {
  Future<Either<Failures, void>> register({
    required RegisterModel registerModel,
  });
}
