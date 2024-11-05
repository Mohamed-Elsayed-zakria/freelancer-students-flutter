import '/features/auth/data/repository/add_personal_picture_repo.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '/core/models/user_credentials.dart';
import '/core/services/auth_services.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/errors/failures.dart';
import '/core/constant/colors.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class AddPersonalPictureImplement extends AddPersonalPictureRepo {
  @override
  Future<Either<Failures, File?>> uploadImageFromDevice() async {
    XFile? pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    try {
      if (pickedImg != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImg.path,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edite',
              toolbarColor: AppColors.kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              activeControlsWidgetColor: AppColors.kPrimaryColor,
            ),
          ],
        );
        if (croppedFile != null) {
          File? addDetailsImgPath = File(croppedFile.path);
          return right(addDetailsImgPath);
        } else {
          return left(PickImageFailures.errorType('No_image_selected'));
        }
      } else {
        return left(PickImageFailures.errorType('No_image_selected'));
      }
    } catch (e) {
      return left(PickImageFailures.errorType(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> uploadImageToDatabase({
    required String imgPath,
  }) async {
    try {
      UserCredentials? userCredentials = AuthServices.readCredentials();
      if (userCredentials == null) {
        return left(
          ServerFailures(errMessage: 'Something went wrong'),
        );
      } else {
        String url =
            "${APIEndPoint.url}${APIEndPoint.personalPicture}/${userCredentials.id}";
        String generatPersonalImageId = const Uuid().v1();
        FormData formData = FormData.fromMap({
          "personalPicture": await MultipartFile.fromFile(
            imgPath,
            filename: "$generatPersonalImageId.jpg",
          ),
        });
        final response = await dio.patch(
          url,
          data: formData,
        );
        final jsonData = response.data['personalPicture'] as String;
        userCredentials.personalPicture = jsonData;
        AuthServices.storeCredentials(userCredentials);
        return right(null);
      }
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
