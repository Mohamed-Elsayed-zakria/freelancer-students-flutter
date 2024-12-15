import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CustomReadMoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final TextStyle style;
  const CustomReadMoreText({
    super.key,
    required this.text,
    required this.trimLines,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: style,
      trimLines: trimLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      lessStyle: AppStyle.kTextStyle16.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
      moreStyle: AppStyle.kTextStyle16.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
