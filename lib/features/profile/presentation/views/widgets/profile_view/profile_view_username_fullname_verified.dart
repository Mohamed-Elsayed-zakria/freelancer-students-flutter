import '/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProfileViewUsernameAndFullnameAndVerified extends StatelessWidget {
  final ProfileModel userData;

  const ProfileViewUsernameAndFullnameAndVerified({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userData.fullName,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                textDirection: TextDirection.ltr,
                "@${userData.username}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Visibility(
                visible: userData.verified,
                child: const Icon(
                  Icons.verified,
                  color: AppColors.kPrimaryColor,
                  size: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
