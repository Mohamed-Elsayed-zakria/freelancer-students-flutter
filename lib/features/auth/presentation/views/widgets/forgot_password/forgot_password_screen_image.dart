import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '/core/constant/assets.dart';

class ForgotPasswordScreenImage extends StatelessWidget {
  const ForgotPasswordScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Opacity(
        opacity: 0.5,
        child: SvgPicture.asset(
          Assets.forgotPassword,
          height: 250,
        ),
      ),
    );
  }
}
