import '/features/posts/presentation/manager/add_post_cubit/add_post_cubit.dart';
import '/features/posts/presentation/manager/add_post_cubit/add_post_state.dart';
import '/features/posts/data/model/add_post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';

class AddPostViewButtomShare extends StatelessWidget {
  const AddPostViewButtomShare({super.key});

  @override
  Widget build(BuildContext context) {
    AddPostCubit blocAccess = BlocProvider.of<AddPostCubit>(context);
    String? userId = AuthServices.currentUserId();
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          AppPages.back(context);
        }
        if (state is AddPostFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
          onPressed: state is AddPostLoading
              ? null
              : () {
                  if (blocAccess.addPostVideoPath == null &&
                      blocAccess.imagePaths.isEmpty) {
                    if (blocAccess.addPostFormKey.currentState!.validate()) {
                      _addNewPost(blocAccess, userId);
                    }
                  } else {
                    _addNewPost(blocAccess, userId);
                  }
                },
          child: const Text(
            'Share',
            style: AppStyle.kTextStyle18,
          ),
        ),
      ),
    );
  }

  void _addNewPost(AddPostCubit blocAccess, String? userId) {
    return blocAccess.createNewPost(
      postDataModel: AddPostModel(
        description: blocAccess.getDescriptionText.text,
        videoUrl: blocAccess.addPostVideoPath?.path,
        imagesUrl: blocAccess.imagePaths,
        personUid: userId!,
        postStatus: blocAccess.selectItem,
      ),
    );
  }
}
