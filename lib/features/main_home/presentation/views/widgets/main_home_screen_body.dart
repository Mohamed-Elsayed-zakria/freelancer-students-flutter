import '/features/notifications/presentation/views/notice_screen.dart';
import '/features/services/presentation/views/services_screen.dart';
import '/features/settings/presentation/views/settings_screen.dart';
import '/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainHomeScreenBody extends StatelessWidget {
  final int pageNumber;

  const MainHomeScreenBody({
    super.key,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: pageNumber,
      children: const [
        HomeView(),
        NoticeScreen(),
        ServicesScreen(),
        SettingsScreen(),
      ],
    );
  }
}
