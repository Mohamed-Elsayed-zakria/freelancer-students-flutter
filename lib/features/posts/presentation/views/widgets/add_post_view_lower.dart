import 'add_post_view_custom_drop_down_menu.dart';
import 'add_post_view_buttom_add_media.dart';
import 'package:flutter/material.dart';

class AddPostViewLower extends StatelessWidget {
  const AddPostViewLower({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AddPostViewButtomAddMedia(),
          AddPostViewCustomDropDownMenu(),
        ],
      ),
    );
  }
}
