import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'forgot_password_screen_custom_dot_indicator.dart';
import 'forgot_password_screen_steep_three.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forgot_password_screen_steep_two.dart';
import 'forgot_password_screen_steep_one.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return Stack(
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: blocAccess.controller,
          children: const [
            ForgotPasswordScreenSteepOne(),
            ForgotPasswordScreenSteepTwo(),
            ForgotPasswordScreenSteepThree(),
          ],
        ),
        ForgotPasswordScreenCustomDotIndicator(
          controller: blocAccess.controller,
          count: 3,
        ),
      ],
    );
  }
}
