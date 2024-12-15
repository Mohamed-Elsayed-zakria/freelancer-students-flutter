import '../../manager/add_post_cubit/add_post_cubit.dart';
import '../../manager/add_post_cubit/add_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddPostViewHeaderLoading extends StatelessWidget {
  const AddPostViewHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return Visibility(
          visible: state is AddPostLoading,
          child: const LinearProgressIndicator(),
        );
      },
    );
  }
}
