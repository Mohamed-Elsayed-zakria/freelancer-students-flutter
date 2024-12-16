import '/features/profile/data/models/profile_model.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';

class ProfileViewOtherUser extends StatelessWidget {
  final ProfileModel userData;

  const ProfileViewOtherUser({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    Size size = SizeScreen.size(context: context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Get.bottomSheet(
                //   ProfileScreenOtherMoreButtom(
                //     userData: userData,
                //   ),
                // );
              },
              icon: const Icon(
                Icons.more_vert_outlined,
              ),
            ),
            SizedBox(
              width: size.width * 0.33,
              child: CustomButton(
                onPressed: () {
                  // Get.to(() => ChatScreenMessages(userData: userDataMessage));
                },
                text: "chat",
              ),
            ),
            SizedBox(
              width: size.width * 0.33,
              child: CustomButton(
                onPressed: () {
                  // userData.followersList.contains(ApiService.user.uid)
                  //                         ? tapUnfolow(userData: userData)
                  //                         : tapFolow(userData: userData);
                },
                text: 'Folow',
                // text: userData.followersList.contains(ApiService.user.uid)
                //     ? "unFolow"
                //     : "Folow",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
