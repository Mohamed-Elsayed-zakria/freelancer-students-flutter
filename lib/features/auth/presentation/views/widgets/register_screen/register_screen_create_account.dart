import '/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '/features/auth/presentation/manager/register_cubit/register_state.dart';
import '/features/auth/data/models/register_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class RegisterCreateAccount extends StatelessWidget {
  const RegisterCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit blocAccess = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AppPages.offAll(
            path: AppRoutes.addPersonalPicture,
            context: context,
          );
          blocAccess.getUsername.clear();
          blocAccess.getFullName.clear();
          blocAccess.getEmail.clear();
          blocAccess.getPassword.clear();
          blocAccess.getRetypePassword.clear();
        } else if (state is RegisterFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is RegisterLoading,
          text: 'Create account',
          onPressed: () {
            bool validateFields =
                blocAccess.formKeyRegister.currentState!.validate();
            blocAccess.validatorAgeField();
            blocAccess.validatorGenderField();

            if (validateFields &&
                blocAccess.validatorAge &&
                blocAccess.validatorGender) {
              blocAccess.createNewAccount(
                regiseterModel: RegisterModel(
                  username: blocAccess.getUsername.text,
                  fullName: blocAccess.getFullName.text,
                  email: blocAccess.getEmail.text,
                  password: blocAccess.getPassword.text,
                  confirmPassword: blocAccess.getRetypePassword.text,
                  gender: blocAccess.gender!,
                  age: blocAccess.dateOfBirth.toString(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
