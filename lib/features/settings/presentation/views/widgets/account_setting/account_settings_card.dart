import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class AccountSettingCard extends StatelessWidget {
  final Function() onTap;
  final String text;
  const AccountSettingCard({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.kSurfaceColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppStyle.kTextStyle16,
              ),
              const Icon(IconlyBroken.arrowRight),
            ],
          ),
        ),
      ),
    );
  }
}
