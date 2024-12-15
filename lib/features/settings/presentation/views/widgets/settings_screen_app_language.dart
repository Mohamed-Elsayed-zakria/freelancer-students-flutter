import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class SettingsScreenAppLanguage extends StatelessWidget {
  const SettingsScreenAppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showLanguageDialog(context),
      title: const Text(
        "Language",
        style: AppStyle.kTextStyle18,
      ),
      leading: const Icon(
        IconlyBroken.setting,
        size: 26,
      ),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Text('Language'),
          contentPadding: const EdgeInsets.all(14),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  AppPages.back(context);
                },
                title: const Text('English'),
              ),
              ListTile(
                onTap: () {
                  AppPages.back(context);
                },
                title: const Text('Arabic'),
              ),
            ],
          ),
        );
      },
    );
  }
}
