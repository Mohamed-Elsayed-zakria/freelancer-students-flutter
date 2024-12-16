import '/features/profile/data/models/profile_experience.dart';
import '/features/profile/data/models/profile_model.dart';
import 'profile_view_username_fullname_verified.dart';
import 'profile_count_following_followers.dart';
import 'profile_view_cover_person_image.dart';
import '/core/services/auth_services.dart';
import 'profile_view_current_user.dart';
import 'package:flutter/material.dart';
import 'profile_view_experience.dart';
import 'profile_view_other_user.dart';
import 'profile_view_analytics.dart';
import '/core/constant/colors.dart';
import 'profile_view_reviews.dart';
import 'profile_view_bio.dart';

class ProfileViewHeader extends StatelessWidget {
  final ProfileModel userData;
  final String otherUid;

  const ProfileViewHeader({
    super.key,
    required this.userData,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    String? currentUserId = AuthServices.currentUserId();
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kSurfaceColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kOnSurfaceColor.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            ProfileViewCoverAndPersonImage(userData: userData),
            ProfileViewUsernameAndFullnameAndVerified(userData: userData),
            const Divider(),
            ProfileViewCountFollowingFollowers(
              userData: userData,
              otherUid: otherUid,
            ),
            const Divider(),
            currentUserId == otherUid
                ? ProfileViewCurrentUser(userData: userData)
                : ProfileViewOtherUser(userData: userData),
            const Divider(),
            ProfileViewBio(textBio: userData.bio),
            const Divider(),
            const ProfileViewAnalytics(),
            const Divider(),
            ProfileViewExperience(
              profileExperience: ProfileExperience(
                title: "Education",
                description: "Flutter Developer",
                subtitle: "Google",
                startDate: "Oct 2022",
                endDate: "Present",
              ),
            ),
            const Divider(),
            ProfileViewExperience(
              profileExperience: ProfileExperience(
                title: "Projects",
                description: "Smart Parking",
                subtitle: "iot",
                startDate: "Oct 2022",
                endDate: "Present",
              ),
            ),
            const Divider(),
            const ProfileViewReviews(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
