import '/core/widgets/form_divider.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ProfileViewAnalytics extends StatelessWidget {
  const ProfileViewAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gigs analytics",
            style: AppStyle.kTextStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const FormDivider(width: 120),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.money_outlined),
              SizedBox(width: 10),
              Text(
                "250\$",
                style: AppStyle.kTextStyle16,
              ),
              SizedBox(width: 10),
              Text("Total earnings", style: AppStyle.kTextStyle16),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.business_center_outlined),
              SizedBox(width: 10),
              Text(
                "10",
                style: AppStyle.kTextStyle16,
              ),
              SizedBox(width: 10),
              Text(
                "Total gigs",
                style: AppStyle.kTextStyle16,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.timer_outlined),
              SizedBox(width: 10),
              Text(
                "50",
                style: AppStyle.kTextStyle16,
              ),
              SizedBox(width: 10),
              Text(
                "Total hours",
                style: AppStyle.kTextStyle16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
