import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/core/utils/responsive_element_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ForgotPasswordScreenCorrectEmail extends StatelessWidget {
  const ForgotPasswordScreenCorrectEmail({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgotPasswordCubit>();
    final Size size = SizeScreen.size(context: context);
    return SizedBox(
      width: responsiveElementSize(size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => {
              cubit.controller.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
            },
            child: Text(
              'Correct email',
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
