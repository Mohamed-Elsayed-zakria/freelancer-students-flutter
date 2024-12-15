import '/features/posts/data/model/post_model/post_model.dart';
import 'package:flutter/material.dart';

class CustomPostStatusIcon extends StatelessWidget {
  final PostModel postData;

  const CustomPostStatusIcon({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return postData.postStatus == "public"
        ? const Icon(
            Icons.public,
            size: 17,
          )
        : const Icon(
            Icons.lock_outlined,
            size: 17,
          );
  }
}
