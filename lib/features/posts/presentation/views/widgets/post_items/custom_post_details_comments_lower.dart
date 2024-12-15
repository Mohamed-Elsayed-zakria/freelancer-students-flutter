import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class CustomPostDetailsCommentsLower extends StatelessWidget {
  final TextEditingController? commentController;
  final Function() onTapSendComment;
  final Function() onTapSendImage;
  const CustomPostDetailsCommentsLower({
    required this.onTapSendComment,
    required this.onTapSendImage,
    this.commentController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTapSendComment,
          icon: const Icon(IconlyBroken.send),
          style: const ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              AppColors.kPrimaryColor,
            ),
          ),
        ),
        Expanded(
          child: Card(
            color: AppColors.kSurfaceColor,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      controller: commentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Write comment",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onTapSendImage,
                  icon: const Icon(
                    IconlyBroken.image,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
