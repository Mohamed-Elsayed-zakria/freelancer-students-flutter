import '/core/widgets/form_divider.dart';
import 'profile_view_work_history.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProfileViewReviews extends StatelessWidget {
  const ProfileViewReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reviews",
            style: AppStyle.kTextStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const FormDivider(width: 120),
          const SizedBox(height: 12),
          const Column(
            children: [
              ProfileViewWorkHistory(),
              SizedBox(height: 12),
              ProfileViewWorkHistory(),
            ],
          ),
        ],
      ),
    );
  }
}
