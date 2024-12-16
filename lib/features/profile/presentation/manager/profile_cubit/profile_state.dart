import '/features/profile/data/models/profile_model.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel userData;

  ProfileSuccess(this.userData);
}

final class ProfileFailure extends ProfileState {
  String errMessage;
  ProfileFailure(this.errMessage);
}
