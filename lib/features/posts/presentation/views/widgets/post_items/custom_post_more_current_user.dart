import '/features/posts/data/model/post_model/post_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CustomPostMoreCurrentUser extends StatelessWidget {
  final PostModel postData;

  const CustomPostMoreCurrentUser({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              AppPages.back(context);
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.delete,
            ),
            title: const Text(
              "Deletet the post",
              style: AppStyle.kTextStyle18,
            ),
          ),
          ListTile(
            onTap: () {
              AppPages.back(context);
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.edit,
            ),
            title: const Text(
              "Edite post",
              style: AppStyle.kTextStyle18,
            ),
          ),
        ],
      ),
    );
  }
}
