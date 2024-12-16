import 'package:cached_network_image/cached_network_image.dart';
import '/features/profile/data/models/profile_model.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProfileViewCoverAndPersonImage extends StatelessWidget {
  final ProfileModel userData;
  const ProfileViewCoverAndPersonImage({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: '${APIEndPoint.mediaBaseUrl}${userData.coverPhoto}',
            fit: BoxFit.cover,
            height: 190,
            width: double.infinity,
            placeholder: (context, url) => Container(
              width: double.infinity,
              height: 190,
              color: AppColors.kBackgroundColor,
            ),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: 190,
              color: AppColors.kBackgroundColor,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(12),
              child: CircleAvatar(
                radius: 82,
                backgroundColor: AppColors.kSurfaceColor,
                child: CircleAvatar(
                  radius: 78,
                  backgroundColor: AppColors.kSurfaceColor,
                  backgroundImage: CachedNetworkImageProvider(
                    '${APIEndPoint.mediaBaseUrl}${userData.personalPicture}',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
