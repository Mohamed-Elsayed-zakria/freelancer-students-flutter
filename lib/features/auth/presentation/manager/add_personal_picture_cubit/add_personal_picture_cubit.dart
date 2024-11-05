import '/features/auth/data/repository/add_personal_picture_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_personal_picture_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

class AddPersonalPictureCubit extends Cubit<AddPersonalPictureState> {
  AddPersonalPictureCubit(this._addPersonalPictureRepo)
      : super(AddPersonalPictureInitial());
  final AddPersonalPictureRepo _addPersonalPictureRepo;
  File? addDetailsImgPath;

  Future<void> uploadImageFromDevice() async {
    Either<Failures, File?> result =
        await _addPersonalPictureRepo.uploadImageFromDevice();
    result.fold(
      (failures) => emit(UploadImageFromDeviceFailure(failures.errMessage)),
      (success) {
        addDetailsImgPath = success;
        emit(UploadImageFromDeviceSuccess());
      },
    );
  }

  Future<void> uploadImageToDatabase() async {
    emit(UploadImageToDatabaseLoading());
    Either<Failures, void> result =
        await _addPersonalPictureRepo.uploadImageToDatabase(
      imgPath: addDetailsImgPath!.path,
    );
    result.fold(
      (failures) => emit(UploadImageToDatabaseFailure(failures.errMessage)),
      (result) => emit(UploadImageToDatabaseSuccess()),
    );
  }
}
