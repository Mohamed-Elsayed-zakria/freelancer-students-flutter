import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class SettingsScreenExitFromApp extends StatelessWidget {
  const SettingsScreenExitFromApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showLogoutDialog(context),
      title: const Text(
        'Log out',
        style: AppStyle.kTextStyle18,
      ),
      leading: const Icon(IconlyBroken.logout),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Text('Log out'),
          content: const Text(
            'Do you want to log out ?',
            style: AppStyle.kTextStyle16,
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 22, 24, 6),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                AuthServices.logout();
                AppPages.offAll(
                  path: AppRoutes.login,
                  context: context,
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => AppPages.back(context),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
