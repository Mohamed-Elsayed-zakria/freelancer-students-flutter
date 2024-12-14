import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenTakeEmail extends StatelessWidget {
  const ForgotPasswordScreenTakeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit blocAccess =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is SendVerificationCodeLoading,
          child: Form(
            key: blocAccess.formKeyGetEmail,
            child: CustomFormField(
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
              label: 'E-mail',
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        );
      },
    );
  }
}
