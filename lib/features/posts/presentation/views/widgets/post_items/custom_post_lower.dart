import '/features/posts/data/model/post_model/post_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class CustomPostLower extends StatelessWidget {
  final PostModel postData;
  const CustomPostLower({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Apply for job"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(IconlyBroken.send),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
