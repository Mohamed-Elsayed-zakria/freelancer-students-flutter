import '/features/profile/data/repository/profile_repo.dart';
import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  final String userId;

  ProfileCubit(this._profileRepo, this.userId) : super(ProfileInitial()) {
    getUserProfileData(
      userId: userId,
    );
  }

  Future<void> getUserProfileData({
    required String userId,
  }) async {
    emit(ProfileLoading());
    Either<Failures, ProfileModel> result =
        await _profileRepo.getUserProfileData(
      userId: userId,
    );
    result.fold(
      (failures) => emit(ProfileFailure(failures.errMessage)),
      (result) => emit(ProfileSuccess(result)),
    );
  }
}
