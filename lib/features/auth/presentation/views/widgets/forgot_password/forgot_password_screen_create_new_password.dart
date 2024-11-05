import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ForgotPasswordScreenCheckEmail extends StatelessWidget {
  const ForgotPasswordScreenCheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'create new password ensure it at differs from previous ones for security',
      style: AppStyle.kTextStyle18,
    );
  }
}
