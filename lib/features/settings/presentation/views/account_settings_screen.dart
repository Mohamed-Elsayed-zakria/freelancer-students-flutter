import 'widgets/account_setting/account_settings_screen_body.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AccountSettingsScreenBody(),
    );
  }
}
