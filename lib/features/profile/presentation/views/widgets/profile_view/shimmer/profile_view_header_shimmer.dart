import '/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProfileViewHeaderShimmer extends StatelessWidget {
  const ProfileViewHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: Stack(
        children: [
          CustomShimmer(
            child: Container(
              color: AppColors.kSurfaceColor,
              height: 190,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomShimmer(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: const CircleAvatar(
                  radius: 82,
                  backgroundColor: AppColors.kSurfaceColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
