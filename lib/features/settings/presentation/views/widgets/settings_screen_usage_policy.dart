import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class SettingsScreenUsagePolicy extends StatelessWidget {
  const SettingsScreenUsagePolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: const Text(
        "Usage policy",
        style: AppStyle.kTextStyle18,
      ),
      leading: const Icon(IconlyBroken.danger),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
