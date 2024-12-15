import '/core/models/user_credentials.dart';
import '/core/services/auth_services.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class HomeScreenCustomCircleAvatar extends StatelessWidget {
  const HomeScreenCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    UserCredentials? userCredentials = AuthServices.readCredentials();
    return GestureDetector(
      onTap: () => AppPages.to(
        context: context,
        path: AppRoutes.profile,
        data: userCredentials.id!,
      ),
      child: CircleAvatar(
        radius: 26,
        backgroundColor: AppColors.kBackgroundColor,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.kBackgroundColor,
          backgroundImage: NetworkImage(
            '${APIEndPoint.mediaBaseUrl}${userCredentials!.personalPicture!}',
          ),
        ),
      ),
    );
  }
}
