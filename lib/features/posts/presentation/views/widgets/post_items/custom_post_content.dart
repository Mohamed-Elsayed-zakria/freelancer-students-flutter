import '/features/posts/data/model/post_model/post_model.dart';
import '/core/utils/custom_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';
import 'custom_post_images.dart';

class CustomPostContent extends StatelessWidget {
  final PostModel postData;

  const CustomPostContent({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical:
                postData.description != null && postData.description!.isEmpty
                    ? 4
                    : 8,
            horizontal: 3,
          ),
          child: Visibility(
            visible: postData.description!.isNotEmpty,
            child: InkWell(
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: postData.description!))
                    .then(
                  (value) => ShowToast.show(msg: "The text has been copied"),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomReadMoreText(
                  text: postData.description!,
                  trimLines: postData.imagesUrl!.isEmpty ? 12 : 6,
                  style: AppStyle.kTextStyle18,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: postData.imagesUrl!.isNotEmpty,
          child: PostCustomImages(urlImages: postData.imagesUrl!),
        ),
      ],
    );
  }
}
