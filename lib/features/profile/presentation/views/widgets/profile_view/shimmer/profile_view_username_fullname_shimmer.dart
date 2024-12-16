import '/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';

class ProfileViewUsernameFullnameShimmer extends StatelessWidget {
  const ProfileViewUsernameFullnameShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);

    return Column(
      children: [
        CustomShimmer(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 15,
            width: size.width * 0.42,
          ),
        ),
        const SizedBox(height: 20),
        CustomShimmer(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 15,
            width: size.width * 0.4,
          ),
        ),
      ],
    );
  }
}
