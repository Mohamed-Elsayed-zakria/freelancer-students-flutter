import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/colors.dart';

class ProfileViewCurrentMoreButtom extends StatelessWidget {
  final ProfileModel userData;

  const ProfileViewCurrentMoreButtom({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
              // Get.to(() => const AccountSettingsScreen());
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.setting,
            ),
            title: const Text("Account settings"),
          ),
          ListTile(
            onTap: () {
              Clipboard.setData(ClipboardData(text: userData.personalPageUrl))
                  .then(
                (value) {
                  if (context.mounted) {
                    AppPages.back(context);
                  }
                  ShowToast.show(msg: "The text has been copied");
                },
              );
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              Icons.copy_all_outlined,
            ),
            title: const Text(
              "Copy the page link",
            ),
          ),
        ],
      ),
    );
  }
}
