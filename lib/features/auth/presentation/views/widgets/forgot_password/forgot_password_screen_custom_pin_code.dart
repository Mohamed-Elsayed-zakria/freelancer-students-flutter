import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '/core/utils/responsive_element_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';

class ForgotPasswordScreenCustomPinCode extends StatelessWidget {
  const ForgotPasswordScreenCustomPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: responsiveElementSize(size),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        pastedTextStyle: const TextStyle(
          color: Colors.black,
        ),
        animationType: AnimationType.slide,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          inactiveColor: Colors.black,
          activeColor: AppColors.kPrimaryColor,
          selectedColor: AppColors.kPrimaryVariantColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (value) {
          blocAccess.getPinCode = value;
        },
        onChanged: (value) {
          blocAccess.getPinCode = value;
        },
        beforeTextPaste: (value) {
          blocAccess.getPinCode = value ?? '';
          return true;
        },
      ),
    );
  }
}
