import '/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class CustomPostImageShimmer extends StatelessWidget {
  const CustomPostImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        width: double.infinity,
        color: AppColors.kSurfaceColor,
      ),
    );
  }
}
