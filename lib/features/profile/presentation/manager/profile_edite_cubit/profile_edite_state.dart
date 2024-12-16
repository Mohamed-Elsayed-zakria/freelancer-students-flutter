abstract class ProfileEditeState {}

final class ProfileEditeInitial extends ProfileEditeState {}

final class ProfileEditeLoading extends ProfileEditeState {}

final class ProfileEditeSuccess extends ProfileEditeState {}

final class ProfileEditeFealure extends ProfileEditeState {
  final String errMessage;

  ProfileEditeFealure(this.errMessage);
}
