import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/utils/size_screen.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class LoginScreenForgotPassword extends StatelessWidget {
  const LoginScreenForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return SizedBox(
      width: responsiveElementSize(size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => AppPages.to(
              path: AppRoutes.forgotPassword,
              context: context,
            ),
            child: Text(
              'Forgot your password',
              style: AppStyle.kTextStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryVariantColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
