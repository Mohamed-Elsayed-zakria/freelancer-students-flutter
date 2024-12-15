import 'package:cached_network_image/cached_network_image.dart';
import 'custom_post_image_shimmer.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class CustomPostShowMultiImage extends StatelessWidget {
  final String imageUrl;
  final double aspectRatio;
  const CustomPostShowMultiImage({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppPages.to(
        context: context,
        path: AppRoutes.customPostShowImage,
        data: imageUrl,
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
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
