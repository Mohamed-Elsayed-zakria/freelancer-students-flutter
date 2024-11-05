import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class RegisterScreenInfoPersonalData extends StatelessWidget {
  const RegisterScreenInfoPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return Container(
      width: responsiveElementSize(size),
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(8.0),
      color: AppColors.kSecondeColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: AppColors.kSurfaceColor,
              ),
              const SizedBox(width: 10),
              Text(
                'Personal data',
                style: AppStyle.kTextStyle18.copyWith(
                  color: AppColors.kSurfaceColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Please enter your personal data',
            style: AppStyle.kTextStyle16.copyWith(
              color: AppColors.kSurfaceColor,
            ),
          ),
        ],
      ),
    );
  }
}
