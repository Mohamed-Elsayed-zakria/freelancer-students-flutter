import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_cubit.dart';
import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileEditeCustomLinearProgress extends StatelessWidget {
  const ProfileEditeCustomLinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditeCubit, ProfileEditeState>(
      builder: (context, state) {
        return Visibility(
          visible: state is ProfileEditeLoading,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const LinearProgressIndicator(),
          ),
        );
      },
    );
  }
}
