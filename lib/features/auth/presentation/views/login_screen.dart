import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/data/repository/implement/login_implement.dart';
import 'widgets/login_screen/login_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginImplement()),
        child: const LoginScreenBody(),
      ),
    );
  }
}
