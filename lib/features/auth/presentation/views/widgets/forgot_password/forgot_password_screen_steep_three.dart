import 'forgot_password_screen_new_pass_desc.dart';
import 'forgot_password_screen_take_password.dart';
import 'forgot_password_screen_finish.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class ForgotPasswordScreenSteepThree extends StatelessWidget {
  const ForgotPasswordScreenSteepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text("Create new password"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => showExitConfirmationDialog(context),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ForgotPasswordScreenNewPassDesc(),
                SizedBox(height: 15),
                ForgotPasswordScreenTakePassword(),
                SizedBox(height: 6),
                ForgotPasswordScreenFinish(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Text("Confirm exit"),
          content: const Text(
            "Are you sure you want to cancel the password change ?",
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 15, 24, 4),
          actionsPadding: const EdgeInsets.all(8),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                AppPages.back(context);
              },
            ),
            TextButton(
              child: const Text("Exit"),
              onPressed: () {
                AppPages.offAll(
                  path: AppRoutes.login,
                  context: context,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
