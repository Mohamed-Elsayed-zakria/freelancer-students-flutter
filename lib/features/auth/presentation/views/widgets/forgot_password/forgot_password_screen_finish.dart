import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/utils/show_toast.dart';
import '/core/routes/app_pages.dart';

class ForgotPasswordScreenFinish extends StatelessWidget {
  const ForgotPasswordScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          AppPages.offAll(
            path: AppRoutes.login,
            context: context,
          );
          blocAccess.getEmail.clear();
          blocAccess.getPassword.clear();
          blocAccess.getRetypePassword.clear();
        } else if (state is ForgotPasswordFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Finish',
          onPressed: () {
            ForgotPasswordCubit blocAccess =
                BlocProvider.of<ForgotPasswordCubit>(context);
            if (blocAccess.formKeyResetPassword.currentState!.validate()) {
              blocAccess.resetPassword(
                email: blocAccess.getEmail.text,
                newPassword: blocAccess.getPassword.text,
                passwordConfirmation: blocAccess.getRetypePassword.text,
              );
            }
          },
        );
      },
    );
  }
}
