import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class ImageViewerBottomSheet extends StatelessWidget {
  final String imagePath;
  const ImageViewerBottomSheet({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: () async {
            AppPages.back(context);
          },
          title: const Text('Download image'),
          leading: const Icon(
            IconlyBroken.download,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
