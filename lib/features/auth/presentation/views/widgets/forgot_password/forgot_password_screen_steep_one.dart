import 'forgot_password_screen_description.dart';
import 'forgot_password_screen_get_started.dart';
import 'forgot_password_screen_take_email.dart';
import 'forgot_password_screen_image.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class ForgotPasswordScreenSteepOne extends StatelessWidget {
  const ForgotPasswordScreenSteepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text("Forgot password"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              AppPages.back(context);
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                ForgotPasswordScreenImage(),
                SizedBox(height: 12),
                ForgotPasswordScreenDescription(),
                SizedBox(height: 15),
                ForgotPasswordScreenTakeEmail(),
                SizedBox(height: 6),
                ForgotPasswordScreenGetStarted(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
