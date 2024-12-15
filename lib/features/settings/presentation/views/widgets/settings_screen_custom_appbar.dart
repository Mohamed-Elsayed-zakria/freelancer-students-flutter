import 'package:flutter/material.dart';

class SettingsScreenCustomAppbar extends StatelessWidget {
  const SettingsScreenCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text('Settings'),
    );
  }
}
