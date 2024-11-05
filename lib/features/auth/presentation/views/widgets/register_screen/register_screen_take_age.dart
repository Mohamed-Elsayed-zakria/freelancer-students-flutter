import '/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '/features/auth/presentation/manager/register_cubit/register_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterScreenTakeAge extends StatelessWidget {
  const RegisterScreenTakeAge({super.key});
  @override
  Widget build(BuildContext context) {
    RegisterCubit blocAccess = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        DateTime? dateOfBirth = blocAccess.dateOfBirth;
        return CustomListTileValidator(
          validator: blocAccess.validatorAge,
          errorMessage: 'Required',
          onTap: () async =>
              await blocAccess.customShowDatePicker(context: context),
          title: blocAccess.dateOfBirth == null
              ? 'Age'
              : "${dateOfBirth!.year}/${dateOfBirth.month}/${dateOfBirth.day}",
          leading: const Icon(Icons.date_range_outlined),
        );
      },
    );
  }
}
