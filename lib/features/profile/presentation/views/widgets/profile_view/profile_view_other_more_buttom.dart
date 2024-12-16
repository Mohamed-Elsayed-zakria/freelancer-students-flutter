import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/constant/colors.dart';
import '/core/utils/show_toast.dart';

class ProfileViewOtherMoreButtom extends StatelessWidget {
  final ProfileModel userData;

  const ProfileViewOtherMoreButtom({
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
            onTap: () async {
              // Get.back();
              // CurrentUserData.listBlock.contains(userData.personalUid)
              //     ? await deleteUserFromListBlock(
              //         otherUid: userData.personalUid)
              //     : await addUserToListBlock(otherUid: userData.personalUid);
            },
            leading: const Icon(
              IconlyBroken.infoSquare,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text("Block"),
            // CurrentUserData.listBlock.contains(userData.personalUid)
            //     ? "unBlock"
            //     : "Block",
          ),
          ListTile(
            onTap: () {
              Clipboard.setData(
                ClipboardData(text: userData.personalPageUrl),
              ).then(
                (value) => ShowToast.show(msg: "The text has been copied"),
              );
              // Get.back();
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              Icons.copy_all_rounded,
              size: 26,
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
