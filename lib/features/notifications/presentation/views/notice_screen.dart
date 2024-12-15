import 'widgets/notice_screen_body.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: NoticeScreenBody(),
    );
  }
}
