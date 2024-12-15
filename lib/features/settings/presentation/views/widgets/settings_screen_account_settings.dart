import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class SettingsScreenAccountSettings extends StatelessWidget {
  const SettingsScreenAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => AppPages.to(
        context: context,
        path: AppRoutes.accountSettings,
      ),
      title: const Text(
        "Account settings",
        style: AppStyle.kTextStyle18,
      ),
      leading: const Icon(IconlyBroken.profile),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
