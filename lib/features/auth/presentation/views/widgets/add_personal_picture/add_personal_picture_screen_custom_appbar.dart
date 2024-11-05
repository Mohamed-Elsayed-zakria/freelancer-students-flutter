import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class AddPersonalPictureScreenCustomAppbar extends StatelessWidget {
  const AddPersonalPictureScreenCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text("Add Personal Picture"),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            AppPages.offAll(
              path: AppRoutes.mainHome,
              context: context,
            );
          },
          child: const Text('Skip'),
        )
      ],
    );
  }
}
