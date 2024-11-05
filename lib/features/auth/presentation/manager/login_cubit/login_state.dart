abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class PasswordVisibility extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  String errMessage;
  LoginFailure(this.errMessage);
}