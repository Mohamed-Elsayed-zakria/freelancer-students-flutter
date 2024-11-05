import '/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreenTakeData extends StatelessWidget {
  const RegisterScreenTakeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        RegisterCubit blocAccess = BlocProvider.of<RegisterCubit>(context);
        return AbsorbPointer(
          absorbing: state is RegisterLoading,
          child: Form(
            key: blocAccess.formKeyRegister,
            child: Column(
              children: [
                CustomFormField(
                  controller: blocAccess.getUsername,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value.length < 3) {
                      return "username is too short";
                    } else if (value.contains(" ")) {
                      return "username cannot contain spaces";
                    } else if (!blocAccess.validCharacters.hasMatch(value)) {
                      return "username can contain only ( abc , 123 , _ )";
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your username',
                  label: 'Username',
                  prefixIcon: const Icon(Icons.person_outline_outlined),
                  keyboardType: TextInputType.text,
                ),
                CustomFormField(
                  controller: blocAccess.getFullName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value.length < 3) {
                      return "Full name is too short";
                    } else {
                      return null;
                    }
                  },
                  label: "Full name",
                  hintText: "Enter your full name",
                  prefixIcon: const Icon(Icons.badge_outlined),
                  keyboardType: TextInputType.text,
                ),
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
                    } else if (value.length < 8) {
                      return 'Password must be greater than or equal to 8 characters';
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
