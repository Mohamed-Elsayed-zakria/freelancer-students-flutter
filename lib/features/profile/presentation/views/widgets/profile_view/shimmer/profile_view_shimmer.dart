import 'profile_view_count_followers_following_shimmer.dart';
import 'profile_view_username_fullname_shimmer.dart';
import 'profile_view_current_user_shimmer.dart';
import 'profile_view_header_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProfileViewShimmer extends StatelessWidget {
  const ProfileViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.kSurfaceColor,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileViewHeaderShimmer(),
            ProfileViewUsernameFullnameShimmer(),
            ProfileViewCountFollowersFollowingShimmer(),
            ProfileViewCurrentUserShimmer(),
            // CustomPostShimmer(),
          ],
        ),
      ),
    );
  }
}
