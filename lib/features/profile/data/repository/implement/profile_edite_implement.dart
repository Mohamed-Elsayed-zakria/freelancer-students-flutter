import '/features/profile/data/repository/profile_edite_repo.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '/core/constant/api_end_point.dart';
import '/core/services/auth_services.dart';
import '/core/constant/colors.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class ProfileEditeImplement extends ProfileEditeRepo {
  @override
  Future<Either<Failures, File>> chooseImagePictureFromGalary() async {
    try {
      final pickedImg =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImg != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImg.path,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edite',
              toolbarColor: AppColors.kPrimaryColor,
              toolbarWidgetColor: AppColors.kSurfaceColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              activeControlsWidgetColor: AppColors.kPrimaryColor,
            ),
          ],
        );

        if (croppedFile != null) {
          return right(File(croppedFile.path));
        }
        return left(PickImageFailures.errorType('No_image_selected'));
      }
      return left(PickImageFailures.errorType('No_image_selected'));
    } catch (e) {
      return left(PickImageFailures.errorType(e.toString()));
    }
  }

  @override
  Future<Either<Failures, File>> chooseImageCoverFromGalary() async {
    try {
      final pickedImg =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImg != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImg.path,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edite',
              toolbarColor: AppColors.kPrimaryColor,
              toolbarWidgetColor: AppColors.kSurfaceColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              activeControlsWidgetColor: AppColors.kPrimaryColor,
            ),
          ],
        );
        if (croppedFile != null) {
          return right(File(croppedFile.path));
        }
        return left(PickImageFailures.errorType('No_image_selected'));
      }
      return left(PickImageFailures.errorType('No_image_selected'));
    } catch (e) {
      return left(PickImageFailures.errorType(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> uploadImagePicture({
    required String imgPath,
    required String userId,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.profileChangePersonalPicture}/$userId";
      String generatPersonalImageId = const Uuid().v1();
      FormData formData = FormData.fromMap({
        "personalPicture": await MultipartFile.fromFile(
          imgPath,
          filename: "$generatPersonalImageId.jpg",
        ),
      });
      final response = await dio.put(
        url,
        data: formData,
      );
      final jsonData = response.data as Map<String, dynamic>;
      final userData = AuthServices.readCredentials();
      userData!.personalPicture = jsonData['data']['personalPicture'];
      AuthServices.storeCredentials(userData);
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

  @override
  Future<Either<Failures, void>> uploadImageCover({
    required String imgPath,
    required String userId,
  }) async {
    try {
      String url =
          "${APIEndPoint.url}${APIEndPoint.profileChangecoverPhoto}/$userId";
      String generatPersonalImageId = const Uuid().v1();
      FormData formData = FormData.fromMap({
        "coverPhoto": await MultipartFile.fromFile(
          imgPath,
          filename: "$generatPersonalImageId.jpg",
        ),
      });
      await dio.put(
        url,
        data: formData,
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

  @override
  Future<Either<Failures, void>> updateBio({
    required String text,
    required String userId,
  }) async {
    try {
      String url = "${APIEndPoint.url}${APIEndPoint.profile}/$userId";
      await dio.put(
        url,
        data: {
          "bio": text,
        },
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
