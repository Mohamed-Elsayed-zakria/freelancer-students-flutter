import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class LoginScreenSignUp extends StatelessWidget {
  const LoginScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: const Text(
            "Don't have an account ?",
            style: AppStyle.kTextStyle16,
          ),
        ),
        InkWell(
          onTap: () => AppPages.to(
            path: AppRoutes.register,
            context: context,
          ),
          child: Text(
            'Sign up',
            style: AppStyle.kTextStyle16.copyWith(
              color: AppColors.kPrimaryVariantColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
