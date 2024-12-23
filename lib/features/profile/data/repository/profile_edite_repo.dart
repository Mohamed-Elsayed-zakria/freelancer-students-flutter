import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

abstract class ProfileEditeRepo extends BaseServices {
  Future<Either<Failures, File>> chooseImagePictureFromGalary();
  Future<Either<Failures, File>> chooseImageCoverFromGalary();
  Future<Either<Failures, String>> uploadImagePicture({
    required String imgPath,
    required String userId,
  });
  Future<Either<Failures, String>> uploadImageCover({
    required String imgPath,
    required String userId,
  });

  Future<Either<Failures, void>> updateBio({
    required String text,
    required String userId,
  });
}
