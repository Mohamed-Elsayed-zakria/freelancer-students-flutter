import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'custom_post_show_single_image.dart';
import 'custom_post_show_multi_image.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class PostCustomImages extends StatefulWidget {
  final List urlImages;

  const PostCustomImages({
    super.key,
    required this.urlImages,
  });

  @override
  State<PostCustomImages> createState() => _PostCustomImagesState();
}

class _PostCustomImagesState extends State<PostCustomImages> {
  final CarouselSliderController controller = CarouselSliderController();
  int activeIndex = 0;

  Map<String, Size> imageSizes = {};

  void _calculateImageSize(String imageUrl) {
    Image.network(imageUrl)
        .image
        .resolve(const ImageConfiguration())
        .addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          setState(() {
            imageSizes[imageUrl] = Size(
              info.image.width.toDouble(),
              info.image.height.toDouble(),
            );
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for (var imageUrl in widget.urlImages) {
      _calculateImageSize("${APIEndPoint.mediaBaseUrl}$imageUrl");
    }
  }

  @override
  Widget build(BuildContext context) {
    String firstImageUrl = "${APIEndPoint.mediaBaseUrl}${widget.urlImages[0]}";
    Size? firstImageSize = imageSizes[firstImageUrl];

    double aspectRatio = firstImageSize != null
        ? firstImageSize.width / firstImageSize.height
        : 13 / 9;

    return widget.urlImages.length > 1
        ? Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                itemCount: widget.urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  String imageUrl =
                      "${APIEndPoint.mediaBaseUrl}${widget.urlImages[index]}";
                  Size? imageSize = imageSizes[imageUrl];
                  double aspectRatio = imageSize != null
                      ? imageSize.width / imageSize.height
                      : 13 / 9; // Default aspect ratio
                  return CustomPostShowMultiImage(
                    aspectRatio: aspectRatio,
                    imageUrl: imageUrl,
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 13 / 9,
                  viewportFraction: 1,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    activeIndex = index;
                    setState(() {});
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  onDotClicked: controller.animateToPage,
                  activeIndex: activeIndex,
                  effect: const WormEffect(
                    activeDotColor: AppColors.kPrimaryColor,
                    radius: 4,
                    dotHeight: 5,
                    dotWidth: 12,
                  ),
                  count: widget.urlImages.length,
                ),
              ),
            ],
          )
        : CustomPostShowSingleImage(
            aspectRatio: aspectRatio,
            firstImageUrl: firstImageUrl,
          );
  }
}
