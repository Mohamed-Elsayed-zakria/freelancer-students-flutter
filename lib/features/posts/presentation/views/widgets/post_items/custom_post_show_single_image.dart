import 'package:cached_network_image/cached_network_image.dart';
import 'custom_post_image_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class CustomPostShowSingleImage extends StatelessWidget {
  final double aspectRatio;
  final String firstImageUrl;
  const CustomPostShowSingleImage({
    super.key,
    required this.aspectRatio,
    required this.firstImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppPages.to(
        context: context,
        path: AppRoutes.customPostShowImage,
        data: firstImageUrl,
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          imageUrl: firstImageUrl,
          width: double.infinity,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          placeholder: (context, url) => const CustomPostImageShimmer(),
          errorWidget: (context, url, error) => const Center(
            child: Text('Failed to load image'),
          ),
        ),
      ),
    );
  }
}
