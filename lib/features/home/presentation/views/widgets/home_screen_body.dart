import '/features/posts/presentation/views/widgets/post_items/custom_post_list_view_items.dart';
import 'home_screen_custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        HomeScreenCustomAppbar(),
        CustomPostListViewItems(),
      ],
    );
  }
}
