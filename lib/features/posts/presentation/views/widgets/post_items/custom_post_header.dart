import 'package:cached_network_image/cached_network_image.dart';
import '/features/posts/data/model/post_model/post_model.dart';
import '/core/widgets/custom_verified_in_circal_avatar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'custom_post_more_current_user.dart';
import '/core/services/auth_services.dart';
import '/core/constant/api_end_point.dart';
import 'custom_post_more_other_user.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import 'custom_post_status_icon.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CustomPostHeader extends StatelessWidget {
  final PostModel postData;

  const CustomPostHeader({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    String? currentUserId = AuthServices.currentUserId();
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: GestureDetector(
        onTap: () => AppPages.to(
          context: context,
          path: AppRoutes.profile,
          data: postData.userData!.id,
        ),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.kBackgroundColor,
              backgroundImage: CachedNetworkImageProvider(
                "${APIEndPoint.mediaBaseUrl}${postData.userData!.personalPicture!}",
              ),
            ),
            CustomVerifiedInCircalAvatar(
              visible: postData.userData!.verified!,
            ),
          ],
        ),
      ),
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '@${postData.userData!.username}',
            style: AppStyle.kTextStyle16,
          ),
          const SizedBox(width: 5),
          Visibility(
            visible: postData.userData!.verified!,
            child: const Icon(
              Icons.verified,
              size: 17,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            MyDateUtil.convertDateTime(historyAsText: postData.createdAt!),
            style: AppStyle.kTextStyle16,
          ),
          const SizedBox(width: 5),
          CustomPostStatusIcon(postData: postData),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return postData.userData!.id == currentUserId
                  ? CustomPostMoreCurrentUser(postData: postData)
                  : CustomPostMoreOtherUser(postData: postData);
            },
          );
        },
        icon: const Icon(IconlyBroken.moreCircle),
      ),
    );
  }
}
