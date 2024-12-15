import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/models/user_credentials.dart';
import '/core/services/auth_services.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class SettingsScreenCustomProfileCard extends StatelessWidget {
  const SettingsScreenCustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    UserCredentials? userCredentials = AuthServices.readCredentials();

    return Column(
      children: [
        ListTile(
          onTap: () => AppPages.to(
            context: context,
            path: AppRoutes.profile,
            data: userCredentials.id!,
          ),
          title: Row(
            children: [
              Text(
                textDirection: TextDirection.ltr,
                '@${userCredentials!.username}',
                style: AppStyle.kTextStyle18,
              ),
            ],
          ),
          subtitle: Text(
            "View profile",
            style: AppStyle.kTextStyle18.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kSurfaceColor,
            backgroundImage: NetworkImage(
              '${APIEndPoint.mediaBaseUrl}${userCredentials.personalPicture!}',
            ),
          ),
          trailing: const Icon(IconlyBroken.arrowRight2),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
