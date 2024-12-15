import '../../manager/add_post_cubit/add_post_cubit.dart';
import '../../manager/add_post_cubit/add_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddPostViewDescription extends StatelessWidget {
  const AddPostViewDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        AddPostCubit blocAccess = BlocProvider.of<AddPostCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Form(
            key: blocAccess.addPostFormKey,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'You must add a description to the post';
                } else {
                  return null;
                }
              },
              controller: blocAccess.getDescriptionText,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 500,
              decoration: const InputDecoration(
                counterText: '',
                hintText: "What are you thinking about",
                border: InputBorder.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
