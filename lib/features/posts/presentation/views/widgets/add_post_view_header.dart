import 'package:cached_network_image/cached_network_image.dart';
import '/core/models/user_credentials.dart';
import '/core/services/auth_services.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class AddPostViewHeader extends StatelessWidget {
  const AddPostViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserCredentials? credentials = AuthServices.readCredentials();
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kSurfaceColor,
        backgroundImage: CachedNetworkImageProvider(
          '${APIEndPoint.mediaBaseUrl}${credentials!.personalPicture!}',
        ),
      ),
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '@${credentials.username}',
          ),
        ],
      ),
      subtitle: const Text("upload post"),
    );
  }
}
