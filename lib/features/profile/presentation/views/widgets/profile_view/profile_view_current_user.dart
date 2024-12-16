import '/features/profile/data/models/profile_model.dart';
import 'profile_view_current_more_buttom.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class ProfileViewCurrentUser extends StatelessWidget {
  final ProfileModel userData;

  const ProfileViewCurrentUser({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ProfileViewCurrentMoreButtom(
                    userData: userData,
                  ),
                ),
                icon: const Icon(Icons.more_vert_outlined),
              ),
              IconButton(
                onPressed: () => AppPages.to(
                  path: AppRoutes.profileQrView,
                  context: context,
                ),
                icon: const Icon(Icons.qr_code_rounded),
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 170,
                  maxHeight: 66,
                ),
                child: CustomButton(
                  onPressed: () => AppPages.to(
                    path: AppRoutes.profileEditeView,
                    context: context,
                    data: userData,
                  ),
                  text: "Edite",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
