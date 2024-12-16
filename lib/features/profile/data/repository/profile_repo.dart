import '/features/profile/data/models/profile_model.dart';
import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo extends BaseServices {
  Future<Either<Failures, ProfileModel>> getUserProfileData({
    required String userId,
  });
}
