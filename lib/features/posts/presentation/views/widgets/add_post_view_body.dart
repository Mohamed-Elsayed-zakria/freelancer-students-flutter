import 'add_post_view_header_loading.dart';
import 'add_post_view_description.dart';
import 'package:flutter/material.dart';
import 'add_post_view_header.dart';
import 'add_post_view_images.dart';
import 'add_post_view_lower.dart';

class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            children: const [
              AddPostViewHeaderLoading(),
              AddPostViewHeader(),
              AddPostViewDescription(),
              AddPostViewImages(),
            ],
          ),
        ),
        const AddPostViewLower(),
      ],
    );
  }
}
