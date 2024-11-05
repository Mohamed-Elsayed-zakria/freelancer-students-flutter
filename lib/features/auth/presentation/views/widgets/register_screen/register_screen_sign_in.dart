import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class RegisterScreenSignIn extends StatelessWidget {
  const RegisterScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return Container(
      width: responsiveElementSize(size),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: const Text(
              'already have an account ?',
              style: AppStyle.kTextStyle16,
            ),
          ),
          InkWell(
            onTap: () => AppPages.off(
              path: AppRoutes.login,
              context: context,
            ),
            child: Text(
              'Sign in',
              style: AppStyle.kTextStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryVariantColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
