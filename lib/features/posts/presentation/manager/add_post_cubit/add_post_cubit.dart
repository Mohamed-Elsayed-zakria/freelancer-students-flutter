import '/features/posts/data/repository/add_post_repo.dart';
import '/features/posts/data/model/add_post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'add_post_state.dart';
import 'dart:io';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this._addPostRepo) : super(AddPostInitial());

  List<String> imagePaths = [];

  final AddPostRepo _addPostRepo;

  final GlobalKey<FormState> addPostFormKey = GlobalKey();

  final TextEditingController getDescriptionText = TextEditingController();

  File? addPostVideoPath;

  List<String> listItem = ["Public", "Private"];
  String selectItem = "Public";

  Future<void> uploadImageFromDevice() async {
    emit(AddPostUploadImageLoading());
    Either<Failures, List<String>> result =
        await _addPostRepo.uploadImageFromDevice();
    result.fold(
      (failures) => emit(AddPostUploadImageFailure(failures.errMessage)),
      (imagePathsResult) {
        imagePaths = imagePathsResult;
        emit(AddPostUploadImageSuccess());
      },
    );
  }

  void removeImage(int index) {
    imagePaths.removeAt(index);
    emit(AddPostUploadImageSuccess());
  }

  void createNewPost({
    required AddPostModel postDataModel,
  }) async {
    emit(AddPostLoading());
    Either<Failures, void> result = await _addPostRepo.createNewPost(
      postDataModel: postDataModel,
    );
    result.fold(
      (failures) => emit(AddPostFailure(failures.errMessage)),
      (result) {
        getDescriptionText.clear();
        imagePaths.clear();
        addPostVideoPath = null;
        emit(AddPostSuccess());
      },
    );
  }
}
