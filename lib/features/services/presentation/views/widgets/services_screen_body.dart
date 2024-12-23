import 'package:flutter_iconly/flutter_iconly.dart';
import 'services_custom_explore_frinds.dart';
import 'services_custom_saved_items.dart';
import 'services_custom_followers.dart';
import 'services_custom_following.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ServicesScreenBody extends StatelessWidget {
  const ServicesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            'Services',
          ),
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
        ),
        SliverList.list(
          children: const [
            // ServicesCustomPeopleNearby(),
            ServicesCustomExploreFrinds(),
            ServicesCustomSavedItems(),
            ServicesCustomFollowers(),
            ServicesCustomFollowing(),
          ],
        ),
      ],
    );
  }
}
