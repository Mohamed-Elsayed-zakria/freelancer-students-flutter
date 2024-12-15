import 'notice_screen_custom_appbar.dart';
import 'package:flutter/material.dart';

class NoticeScreenBody extends StatelessWidget {
  const NoticeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        NoticeScreenCustomAppbar(),
      ],
    );
  }
}
