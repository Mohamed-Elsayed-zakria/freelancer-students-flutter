import '/features/auth/presentation/views/widgets/custom_header.dart';
import 'login_screen_forgot_password.dart';
import 'login_screen_button_sign_in.dart';
import 'package:flutter/material.dart';
import 'login_screen_take_data.dart';
import 'login_screen_sign_up.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomHeader(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                LoginScreenTakeData(),
                SizedBox(height: 10),
                LoginScreenButtonSignIn(),
                SizedBox(height: 30),
                LoginScreenForgotPassword(),
                SizedBox(height: 30),
                LoginScreenSignUp(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
