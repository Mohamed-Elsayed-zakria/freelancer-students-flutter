import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/presentation/manager/login_cubit/login_state.dart';
import '/features/auth/data/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class LoginScreenButtonSignIn extends StatelessWidget {
  const LoginScreenButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          AppPages.offAll(
            path: AppRoutes.mainHome,
            context: context,
          );
        } else if (state is LoginFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return CustomButton(
          isLoading: state is LoginLoading,
          text: 'sign in',
          onPressed: () {
            if (cubit.formKeyLogin.currentState!.validate()) {
              cubit.login(
                loginModel: LoginModel(
                  email: cubit.getEmail.text,
                  password: cubit.getPassword.text,
                ),
              );
            }
          },
        );
      },
    );
  }
}
