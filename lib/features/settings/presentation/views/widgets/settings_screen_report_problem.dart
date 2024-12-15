import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class SettingsScreenReportProblem extends StatelessWidget {
  const SettingsScreenReportProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()  {},
      title: const Text(
        "Report problem",
        style: AppStyle.kTextStyle18,
      ),
      leading: const Icon(IconlyBroken.call),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
