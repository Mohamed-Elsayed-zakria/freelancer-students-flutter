import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/style.dart';

class ForgotPasswordScreenNewPassDesc extends StatelessWidget {
  const ForgotPasswordScreenNewPassDesc({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);
    return SizedBox(
      width: responsiveElementSize(size),
      child: const Text(
        'New password ensure it at differs from previous ones for security',
        style: AppStyle.kTextStyle16,
      ),
    );
  }
}
