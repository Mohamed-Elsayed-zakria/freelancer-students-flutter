import '/features/posts/presentation/manager/add_post_cubit/add_post_cubit.dart';
import '/features/posts/presentation/manager/add_post_cubit/add_post_state.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import 'dart:io';

class AddPostViewImages extends StatelessWidget {
  const AddPostViewImages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        AddPostCubit blocAccess = BlocProvider.of<AddPostCubit>(context);
        return Visibility(
          visible: blocAccess.imagePaths.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: blocAccess.imagePaths.length == 1 ? 1 : 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              itemCount: blocAccess.imagePaths.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: blocAccess.imagePaths.length == 1
                          ? LimitedBox(
                              maxHeight: size.height * 0.55,
                              child: Image.file(
                                filterQuality: FilterQuality.high,
                                File(blocAccess.imagePaths[index]),
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            )
                          : SizedBox(
                              height: size.height * .3,
                              child: Image.file(
                                filterQuality: FilterQuality.high,
                                File(blocAccess.imagePaths[index]),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    IconButton(
                      icon: const Icon(
                        color: AppColors.kSecondeColor,
                        IconlyBroken.delete,
                        size: 28,
                      ),
                      onPressed: () => blocAccess.removeImage(index),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
