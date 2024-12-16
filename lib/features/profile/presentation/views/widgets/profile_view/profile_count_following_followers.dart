import '/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProfileViewCountFollowingFollowers extends StatelessWidget {
  final ProfileModel userData;
  final String otherUid;

  const ProfileViewCountFollowingFollowers({
    super.key,
    required this.userData,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Text(
                      "${userData.followers.length}",
                      style: AppStyle.kTextStyle16,
                    ),
                    const Text(
                      "Followers",
                      style: AppStyle.kTextStyle16,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Text(
                      "${userData.following.length}",
                      style: AppStyle.kTextStyle16,
                    ),
                    Text(
                      userData.personalUid == otherUid
                          ? "Following"
                          : "Otherfollowing",
                      style: AppStyle.kTextStyle16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
