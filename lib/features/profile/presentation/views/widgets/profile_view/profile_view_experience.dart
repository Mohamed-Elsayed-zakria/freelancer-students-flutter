import '/features/profile/data/models/profile_experience.dart';
import 'package:flutter/material.dart';
import '/core/constant/assets.dart';
import '/core/constant/style.dart';

class ProfileViewExperience extends StatelessWidget {
  final ProfileExperience profileExperience;
  const ProfileViewExperience({
    super.key,
    required this.profileExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                profileExperience.title,
                style: AppStyle.kTextStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        ListTile(
          title: Text(
            profileExperience.description,
            style: AppStyle.kTextStyle16,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                profileExperience.subtitle,
              ),
              Text(
                "${profileExperience.startDate} - ${profileExperience.endDate}",
              ),
            ],
          ),
          leading: SizedBox(
            height: 55,
            width: 40,
            child: Image.asset(
              Assets.education,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
