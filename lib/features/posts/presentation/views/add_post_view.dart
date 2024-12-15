import '/features/posts/presentation/manager/add_post_cubit/add_post_cubit.dart';
import '/features/posts/data/repository/add_post_implement.dart';
import 'widgets/add_post_view_buttom_share.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/add_post_view_body.dart';
import 'package:flutter/material.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(AddPostImplement()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add post'),
          actions: const [
            AddPostViewButtomShare(),
          ],
        ),
        body: const AddPostViewBody(),
      ),
    );
  }
}
