import '/features/home/presentation/manager/home_get_posts_cubit/home_get_posts_cubit.dart';
import '/features/home/presentation/manager/home_get_posts_cubit/home_get_posts_state.dart';
import '/features/posts/presentation/views/widgets/post_items/custom_post_shimmer.dart';
import '/features/posts/data/model/post_model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'custom_post_not_found.dart';
import 'custom_post_item.dart';

class CustomPostListViewItems extends StatelessWidget {
  const CustomPostListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeGetPostsCubit, HomeGetPostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeGetPostsSuccess) {
          List<PostModel> posts = [];
          posts = state.posts;
          return posts.isNotEmpty
              ? SliverList.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => CustomPostItem(
                    postData: posts[index],
                  ),
                )
              : const CustomPostNotFount();
        }
        if (state is HomeGetPostsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(state.errMessage),
              ),
            ),
          );
        }
        return SliverList.builder(
          itemCount: 2,
          itemBuilder: (context, index) => const CustomPostShimmer(),
        );
      },
    );
  }
}
