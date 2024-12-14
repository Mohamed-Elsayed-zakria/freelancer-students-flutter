import '/features/auth/data/repository/forgot_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'forgot_password_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotPassword) : super(ForgotPasswordInitial());

  final ForgotPasswordRepo _forgotPassword;

  final TextEditingController getEmail = TextEditingController();
  final TextEditingController getPassword = TextEditingController();
  final TextEditingController getRetypePassword = TextEditingController();

  String getPinCode = '';

  final GlobalKey<FormState> formKeyGetEmail = GlobalKey();
  final GlobalKey<FormState> formKeyResetPassword = GlobalKey();

  final PageController controller = PageController();

  bool passwordVisibility = true;
  bool rePasswordVisibility = true;

  void showPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    emit(ForgotPasswordInitial());
  }

  void showRePasswordVisibility() {
    rePasswordVisibility = !rePasswordVisibility;
    emit(ForgotPasswordInitial());
  }

  Future<void> sendVerificationCode({
    required String email,
  }) async {
    emit(SendVerificationCodeLoading());
    Either<Failures, void> result = await _forgotPassword.sendVerificationCode(
      email: email,
    );
    result.fold(
      (failures) => emit(SendVerificationCodeFailure(failures.errMessage)),
      (result) => emit(SendVerificationCodeSuccess()),
    );
  }

  Future<void> reSendVerificationCode({
    required String email,
  }) async {
    emit(ReSendVerificationCodeLoading());
    Either<Failures, void> result = await _forgotPassword.sendVerificationCode(
      email: email,
    );
    result.fold(
      (failures) => emit(ReSendVerificationCodeFailure(failures.errMessage)),
      (result) => emit(ReSendVerificationCodeSuccess()),
    );
  }

  Future<void> verifyResetCode({
    required String email,
    required String pinCode,
  }) async {
    emit(VerifyResetCodeLoading());
    Either<Failures, void> result = await _forgotPassword.verifyResetCode(
      email: email,
      pinCode: pinCode,
    );
    result.fold(
      (failures) => emit(VerifyResetCodeFailure(failures.errMessage)),
      (result) => emit(VerifyResetCodeSuccess()),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    emit(ResetPasswordLoading());
    Either<Failures, void> result = await _forgotPassword.resetPassword(
      email: email,
      newPassword: newPassword,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (failures) => emit(ResetPasswordFailure(failures.errMessage)),
      (result) => emit(ResetPasswordSuccess()),
    );
  }
}
