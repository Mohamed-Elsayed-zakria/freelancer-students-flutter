abstract class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class SendVerificationCodeLoading extends ForgotPasswordState {}

final class SendVerificationCodeSuccess extends ForgotPasswordState {}

final class SendVerificationCodeFailure extends ForgotPasswordState {
  String errMessage;
  SendVerificationCodeFailure(this.errMessage);
}

final class ReSendVerificationCodeLoading extends ForgotPasswordState {}

final class ReSendVerificationCodeSuccess extends ForgotPasswordState {}

final class ReSendVerificationCodeFailure extends ForgotPasswordState {
  String errMessage;
  ReSendVerificationCodeFailure(this.errMessage);
}

final class VerifyResetCodeLoading extends ForgotPasswordState {}

final class VerifyResetCodeSuccess extends ForgotPasswordState {}

final class VerifyResetCodeFailure extends ForgotPasswordState {
  String errMessage;
  VerifyResetCodeFailure(this.errMessage);
}

final class ResetPasswordLoading extends ForgotPasswordState {}

final class ResetPasswordSuccess extends ForgotPasswordState {}

final class ResetPasswordFailure extends ForgotPasswordState {
  String errMessage;
  ResetPasswordFailure(this.errMessage);
}
