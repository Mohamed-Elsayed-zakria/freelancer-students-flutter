import '/features/auth/presentation/manager/add_personal_picture_cubit/add_personal_picture_cubit.dart';
import '/features/auth/data/repository/implement/add_personal_picture_implement.dart';
import 'widgets/add_personal_picture/add_personal_picture_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddPersonalPictureScreen extends StatelessWidget {
  const AddPersonalPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddPersonalPictureCubit(
          AddPersonalPictureImplement(),
        ),
        child: const AddPersonalPictureScreenBody(),
      ),
    );
  }
}
