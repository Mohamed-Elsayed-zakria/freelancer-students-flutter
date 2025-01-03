import 'package:cached_network_image/cached_network_image.dart';
import 'image_viewer_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class CustomPostImageViewBody extends StatelessWidget {
  final String imagePath;

  const CustomPostImageViewBody({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 20 || details.primaryDelta! < -20) {
            AppPages.back(context);
          }
        },
        onLongPress: () => showModalBottomSheet(
          context: context,
          builder: (context) => ImageViewerBottomSheet(imagePath: imagePath),
        ),
        child: Scaffold(
          backgroundColor: AppColors.kOnSurfaceColor,
          body: Stack(
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            ImageViewerBottomSheet(imagePath: imagePath),
                      ),
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: AppColors.kSurfaceColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => AppPages.back(context),
                      icon: const Icon(
                        color: AppColors.kSurfaceColor,
                        Icons.close_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
