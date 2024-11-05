import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ForgotPasswordScreenCustomDotIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  const ForgotPasswordScreenCustomDotIndicator({
    super.key,
    required this.count,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, .8),
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: const SlideEffect(
          spacing: 10.0,
          radius: 6.0,
          dotWidth: 30.0,
          dotHeight: 8.0,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1.5,
          dotColor: Colors.blueGrey,
          activeDotColor: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
