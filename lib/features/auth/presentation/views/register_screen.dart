import '/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '/features/auth/data/repository/implement/register_implement.dart';
import 'widgets/register_screen/register_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: BlocProvider(
        create: (context) => RegisterCubit(RegisterImplement()),
        child: const RegisterScreenBody(),
      ),
    );
  }
}
