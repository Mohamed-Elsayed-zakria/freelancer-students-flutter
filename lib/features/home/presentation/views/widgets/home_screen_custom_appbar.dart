import 'package:flutter_iconly/flutter_iconly.dart';
import 'home_screen_custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class HomeScreenCustomAppbar extends StatelessWidget {
  const HomeScreenCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const HomeScreenCustomCircleAvatar(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyBroken.search,
            color: AppColors.kOnSurfaceColor,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () => AppPages.to(
          context: context,
          path: AppRoutes.addPostView,
        ),
        icon: const Icon(
          IconlyBroken.arrowUpSquare,
          color: AppColors.kOnSurfaceColor,
        ),
      ),
      centerTitle: true,
      floating: true,
      snap: true,
    );
  }
}
