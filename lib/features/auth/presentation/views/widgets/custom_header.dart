import '/core/widgets/show_up_animation.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/assets.dart';
import '/core/constant/colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * 0.2,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: AppColors.kPrimaryColor,
        ),
        constraints: const BoxConstraints(
          maxHeight: 220,
          minHeight: 120,
        ),
        child: Center(
          child: AspectRatio(
            aspectRatio: 3.2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ShowUp(
                delay: 10,
                child: Image.asset(
                  Assets.logo,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
