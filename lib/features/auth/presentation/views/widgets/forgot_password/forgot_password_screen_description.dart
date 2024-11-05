import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/style.dart';

class ForgotPasswordScreenDescription extends StatelessWidget {
  const ForgotPasswordScreenDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);
    return SizedBox(
      width: responsiveElementSize(size),
      child: const Text(
        'Enter your email to reset the password.',
        style: AppStyle.kTextStyle16,
      ),
    );
  }
}
