import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'forgot_password_screen_check_email_descreption.dart';
import 'forgot_password_screen_custom_pin_code.dart';
import 'forgot_password_screen_correct_email.dart';
import 'forgot_password_screen_check_email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forgot_password_count_down_timer.dart';
import 'forgot_password_screen_next.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenSteepTwo extends StatelessWidget {
  const ForgotPasswordScreenSteepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              blocAccess.controller.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ForgotPasswordScreenCheckEmail(),
                SizedBox(height: 12),
                ForgotPasswordScreenCheckEmailDescreption(),
                SizedBox(height: 15),
                ForgotPasswordScreenCustomPinCode(),
                SizedBox(height: 6),
                ForgotPasswordScreenNext(),
                SizedBox(height: 14),
                ForgotPasswordCountdownTimer(),
                SizedBox(height: 14),
                ForgotPasswordScreenCorrectEmail(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
