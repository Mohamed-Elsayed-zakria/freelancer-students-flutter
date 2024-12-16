import '/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import '/features/profile/data/repository/implement/profile_implement.dart';
import 'widgets/profile_view/profile_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProfileView extends StatelessWidget {
  final String otherUid;
  const ProfileView({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: BlocProvider(
        create: (context) => ProfileCubit(ProfileImplement(), otherUid),
        child: ProfileViewBody(otherUid: otherUid),
      ),
    );
  }
}
