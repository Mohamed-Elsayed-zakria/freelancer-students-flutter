import '/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/features/auth/data/models/enum/register_gender.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class RegisterScreenTakeGender extends StatelessWidget {
  const RegisterScreenTakeGender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        RegisterCubit blocAccess = BlocProvider.of<RegisterCubit>(context);
        return CustomListTileValidator(
          validator: blocAccess.validatorGender,
          errorMessage: 'Required',
          onTap: () => _dialogBuilder(
            context: context,
            title: 'Gender',
            content: [
              ListTile(
                onTap: () {
                  blocAccess.setGender(RegisterGender.male.name);
                  AppPages.back(context);
                },
                title: const Text('Male'),
              ),
              ListTile(
                onTap: () {
                  blocAccess.setGender(RegisterGender.female.name);
                  AppPages.back(context);
                },
                title: const Text('Female'),
              ),
            ],
            action: TextButton(
              child: const Text('Close'),
              onPressed: () => AppPages.back(context),
            ),
          ),
          title: blocAccess.gender != null
              ? blocAccess.gender == RegisterGender.male.name
                  ? 'Male'
                  : 'Female'
              : 'Gender',
          leading: const Icon(
            FontAwesomeIcons.venusMars,
            size: 18,
          ),
        );
      },
    );
  }

  Future<void> _dialogBuilder({
    required BuildContext context,
    required List<Widget> content,
    required String title,
    required Widget action,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          titlePadding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
          actionsPadding:
              const EdgeInsets.only(left: 22, right: 22, bottom: 10),
          title: Text(title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: content,
          ),
          actions: <Widget>[
            action,
          ],
        );
      },
    );
  }
}
