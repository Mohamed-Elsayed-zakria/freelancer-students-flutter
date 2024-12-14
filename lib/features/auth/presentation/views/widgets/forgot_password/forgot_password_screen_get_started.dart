import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

class ForgotPasswordScreenGetStarted extends StatelessWidget {
  const ForgotPasswordScreenGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          current is SendVerificationCodeSuccess ||
          current is SendVerificationCodeLoading ||
          current is SendVerificationCodeFailure,
      listener: (context, state) {
        if (state is SendVerificationCodeSuccess) {
          blocAccess.controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        } else if (state is SendVerificationCodeFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is SendVerificationCodeLoading,
          text: 'Get started',
          onPressed: () {
            if (blocAccess.formKeyGetEmail.currentState!.validate()) {
              blocAccess.sendVerificationCode(
                email: blocAccess.getEmail.text,
              );
            }
          },
        );
      },
    );
  }
}
