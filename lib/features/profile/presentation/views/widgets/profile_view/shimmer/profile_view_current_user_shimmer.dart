import '/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProfileViewCurrentUserShimmer extends StatelessWidget {
  const ProfileViewCurrentUserShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomShimmer(
              child: Icon(Icons.more_vert_rounded),
            ),
            CustomShimmer(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.kSurfaceColor,
                ),
              ),
            ),
            CustomShimmer(
              child: Container(
                height: 50,
                width:200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.kSurfaceColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomShimmer(
          child: Container(
            color: AppColors.kSurfaceColor,
            height: 3,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
