import '/features/posts/data/model/post_model/post_model.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'custom_post_content.dart';
import 'custom_post_header.dart';
import 'custom_post_lower.dart';

class CustomPostItem extends StatelessWidget {
  final PostModel postData;
  const CustomPostItem({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kSurfaceColor,
      child: Column(
        children: [
          CustomPostHeader(postData: postData),
          CustomPostContent(postData: postData),
          CustomPostLower(postData: postData),
        ],
      ),
    );
  }
}
