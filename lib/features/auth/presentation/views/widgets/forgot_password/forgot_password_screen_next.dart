import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

class ForgotPasswordScreenNext extends StatelessWidget {
  const ForgotPasswordScreenNext({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          blocAccess.controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        } else if (state is ForgotPasswordFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is ForgotPasswordLoading,
          text: 'Next',
          onPressed: () {
            ForgotPasswordCubit blocAccess =
                BlocProvider.of<ForgotPasswordCubit>(context);
            if (blocAccess.getPinCode.length != 6) {
              return ShowToast.show(msg: 'Pin code must be 6 digits');
            }
            blocAccess.verifyResetCode(
              email: blocAccess.getEmail.text,
              pinCode: blocAccess.getPinCode,
            );
          },
        );
      },
    );
  }
}