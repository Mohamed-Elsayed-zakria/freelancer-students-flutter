import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenTakePassword extends StatelessWidget {
  const ForgotPasswordScreenTakePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        ForgotPasswordCubit blocAccess =
            BlocProvider.of<ForgotPasswordCubit>(context);
        return AbsorbPointer(
          absorbing: state is ForgotPasswordLoading,
          child: Form(
            key: blocAccess.formKeyResetPassword,
            child: Column(
              children: [
                CustomFormField(
                  controller: blocAccess.getPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value.length < 8) {
                      return 'Password must be greater than or equal to 8 characters';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your new password',
                  label: 'New password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  obscureText: blocAccess.passwordVisibility,
                  suffixIcon: IconButton(
                    onPressed: () => blocAccess.showPasswordVisibility(),
                    icon: blocAccess.passwordVisibility
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                CustomFormField(
                  controller: blocAccess.getRetypePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (blocAccess.getPassword.text !=
                        blocAccess.getRetypePassword.text) {
                      return "Password does not match";
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Reconfirm your password',
                  label: 'Confirm password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  obscureText: blocAccess.rePasswordVisibility,
                  suffixIcon: IconButton(
                    onPressed: () => blocAccess.showRePasswordVisibility(),
                    icon: blocAccess.rePasswordVisibility
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
