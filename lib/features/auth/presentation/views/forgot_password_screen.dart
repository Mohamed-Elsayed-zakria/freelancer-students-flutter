import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/data/repository/implement/forgot_password_implement.dart';
import 'widgets/forgot_password/forgot_password_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        ForgotPasswordImplement(),
      ),
      child: const Scaffold(
        body: ForgotPasswordScreenBody(),
      ),
    );
  }
}
