import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/core/utils/responsive_element_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/style.dart';

class ForgotPasswordScreenCheckEmailDescreption extends StatelessWidget {
  const ForgotPasswordScreenCheckEmailDescreption({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);
    var cubit = context.read<ForgotPasswordCubit>();
    return SizedBox(
      width: responsiveElementSize(size),
      child: Text.rich(
        TextSpan(
          text: "We've sent you an email with a code. Please check your email ",
          style: AppStyle.kTextStyle16,
          children: [
            TextSpan(
              text: cubit.getEmail.text,
              style: AppStyle.kTextStyle16.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
