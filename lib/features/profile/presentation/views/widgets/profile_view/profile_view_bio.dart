import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProfileViewBio extends StatelessWidget {
  final String textBio;
  const ProfileViewBio({
    super.key,
    required this.textBio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(
            IconlyBroken.infoCircle,
            color: AppColors.kPrimaryColor,
          ),
          const SizedBox(width: 8),
          const Text(
            "Bio",
            style: AppStyle.kTextStyle16,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              textBio,
              style: AppStyle.kTextStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
