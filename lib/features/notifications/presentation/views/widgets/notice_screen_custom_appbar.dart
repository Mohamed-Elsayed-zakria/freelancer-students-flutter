import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class NoticeScreenCustomAppbar extends StatelessWidget {
  const NoticeScreenCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Notifications'),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyBroken.search,
              color: AppColors.kOnSurfaceColor,
            ),
          ),
        ),
      ],
      floating: true,
      snap: true,
    );
  }
}
