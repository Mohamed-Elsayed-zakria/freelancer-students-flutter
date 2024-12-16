import '/features/profile/presentation/views/widgets/profile_view/shimmer/profile_view_shimmer.dart';
import '/features/profile/presentation/views/widgets/profile_view/profile_view_header.dart';
import '/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import '/features/profile/presentation/manager/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  final String otherUid;
  const ProfileViewBody({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final userData = state.userData;
          return CustomScrollView(
            slivers: [
              ProfileViewHeader(
                userData: userData,
                otherUid: otherUid,
              ),
            ],
          );
        }
        if (state is ProfileFailure) {
          return Center(child: Text(state.errMessage));
        }
        return const ProfileViewShimmer();
      },
    );
  }
}
