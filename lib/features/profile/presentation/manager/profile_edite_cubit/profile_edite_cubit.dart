import '/features/profile/data/repository/profile_edite_repo.dart';
import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'profile_edite_state.dart';
import 'dart:io';

class ProfileEditeCubit extends Cubit<ProfileEditeState> {
  final ProfileEditeRepo _profileEditeRepo;
  ProfileEditeCubit(this._profileEditeRepo) : super(ProfileEditeInitial());

  File? updateImgPathPicture;
  File? updateImgPathCover;

  final TextEditingController getTextBio = TextEditingController();

  final GlobalKey<FormState> profileKeyLogin = GlobalKey();

  Future<void> chooseImagePictureFromGalary() async {
    Either<Failures, File> result =
        await _profileEditeRepo.chooseImagePictureFromGalary();
    result.fold(
      (failures) => emit(ProfileEditeFealure(failures.errMessage)),
      (result) {
        updateImgPathPicture = result;
        emit(ProfileEditeSuccess());
      },
    );
  }

  Future<void> chooseImageCoverFromGalary() async {
    Either<Failures, File> result =
        await _profileEditeRepo.chooseImageCoverFromGalary();
    result.fold(
      (failures) => emit(ProfileEditeFealure(failures.errMessage)),
      (result) {
        updateImgPathCover = result;
        emit(ProfileEditeSuccess());
      },
    );
  }

  Future<void> uploadImagePicture({
    required String imgPath,
    required String userId,
    required ProfileModel userData,
  }) async {
    emit(ProfileEditeLoading());
    Either<Failures, String> result = await _profileEditeRepo.uploadImagePicture(
      imgPath: imgPath,
      userId: userId,
    );
    result.fold(
      (failures) => emit(ProfileEditeFealure(failures.errMessage)),
      (result) {
        userData.personalPicture = result;
        updateImgPathPicture = null;
        emit(ProfileEditeSuccess());
      },
    );
  }

  Future<void> uploadImageCover({
    required String imgPath,
    required String userId,
    required ProfileModel userData,
  }) async {
    emit(ProfileEditeLoading());
    Either<Failures, String> result = await _profileEditeRepo.uploadImageCover(
      imgPath: imgPath,
      userId: userId,
    );
    result.fold(
      (failures) => emit(ProfileEditeFealure(failures.errMessage)),
      (result) {
        userData.coverPhoto = result;
        updateImgPathCover = null;
        emit(ProfileEditeSuccess());
      },
    );
  }

  Future<void> updateBio({
    required String text,
    required String userId,
  }) async {
    emit(ProfileEditeLoading());
    Either<Failures, void> result = await _profileEditeRepo.updateBio(
      text: text,
      userId: userId,
    );
    result.fold(
      (failures) => emit(ProfileEditeFealure(failures.errMessage)),
      (result) {
        emit(ProfileEditeSuccess());
      },
    );
  }
}
