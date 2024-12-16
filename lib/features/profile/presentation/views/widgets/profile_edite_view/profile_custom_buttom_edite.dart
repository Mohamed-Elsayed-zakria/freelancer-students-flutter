import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProfileCustomButtomEdite extends StatelessWidget {
  final Function() onPressed;
  const ProfileCustomButtomEdite({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.kSurfaceColor,
        ),
      ),
      child: const Text(
        "Edite",
        style: AppStyle.kTextStyle16,
      ),
    );
  }
}
