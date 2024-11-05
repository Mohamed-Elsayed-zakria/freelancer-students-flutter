import '/core/services/base_service.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

abstract class AddPersonalPictureRepo extends BaseServices {
  Future<Either<Failures, File?>> uploadImageFromDevice();
  Future<Either<Failures, void>> uploadImageToDatabase({
    required String imgPath,
  });
}
