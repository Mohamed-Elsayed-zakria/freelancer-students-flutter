import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/style.dart';

class ForgotPasswordScreenCheckEmail extends StatelessWidget {
  const ForgotPasswordScreenCheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);
    return SizedBox(
      width: responsiveElementSize(size),
      child: const Text(
        "Check your email",
        style: AppStyle.kTextStyle18,
      ),
    );
  }
}
