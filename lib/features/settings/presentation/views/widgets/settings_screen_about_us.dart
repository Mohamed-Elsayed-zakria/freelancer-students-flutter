import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class SettingsScreenAboutUs extends StatelessWidget {
  const SettingsScreenAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: const Text(
        "About us",
        style: AppStyle.kTextStyle18,
      ),
      leading: const Icon(IconlyBroken.infoSquare),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
