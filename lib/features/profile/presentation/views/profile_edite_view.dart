import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_cubit.dart';
import '/features/profile/data/repository/implement/profile_edite_implement.dart';
import 'widgets/profile_edite_view/profile_edite_view_body.dart';
import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileEditeView extends StatelessWidget {
  final ProfileModel userData;
  const ProfileEditeView({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileEditeCubit(ProfileEditeImplement()),
        child: ProfileEditeViewBody(
          userData: userData,
        ),
      ),
    );
  }
}
