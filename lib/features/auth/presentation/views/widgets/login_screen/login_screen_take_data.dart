import '/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreenTakeData extends StatelessWidget {
  const LoginScreenTakeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => current is PasswordVisibility,
      builder: (context, state) {
        LoginCubit blocAccess = context.read<LoginCubit>();
        return AbsorbPointer(
          absorbing: state is LoginLoading,
          child: Form(
            key: blocAccess.formKeyLogin,
            child: Column(
              children: [
                CustomFormField(
                  controller: blocAccess.getEmail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (!EmailValidator.validate(value)) {
                      return "Valid email";
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your email',
                  label: 'E-mail',
                  prefixIcon: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomFormField(
                  controller: blocAccess.getPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your password',
                  label: 'Password',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
