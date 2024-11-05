import '/features/auth/data/models/user_session/user_session.dart';
import '/features/auth/data/repository/login_repo.dart';
import '/features/auth/data/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/services/auth_services.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final TextEditingController getEmail = TextEditingController();
  final TextEditingController getPassword = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey();

  bool passwordVisibility = true;

  void showPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    emit(PasswordVisibility());
  }

  Future<void> login({
    required LoginModel loginModel,
  }) async {
    emit(LoginLoading());
    Either<Failures, UserSession> result = await _loginRepo.login(
      loginModel: loginModel,
    );
    result.fold(
      (failures) => emit(LoginFailure(failures.errMessage)),
      (result) {
        AuthServices.storeCredentials(
          result.convertToUserCredentials(),
        );
        emit(LoginSuccess());
      },
    );
  }
}
