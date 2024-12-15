import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import 'account_settings_card.dart';

class AccountSettingsScreenBody extends StatelessWidget {
  const AccountSettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Account settings'),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AccountSettingCard(
                  onTap: () => AppPages.to(
                    context: context,
                    path: AppRoutes.accountInformation,
                  ),
                  text: 'Account information',
                ),
                AccountSettingCard(
                  onTap: () => AppPages.to(
                    context: context,
                    path: AppRoutes.editePersonalInformation,
                  ),
                  text: 'Edite personal information',
                ),
                AccountSettingCard(
                  onTap: () => AppPages.to(
                    context: context,
                    path: AppRoutes.blockedUsers,
                  ),
                  text: 'Blocked users',
                ),
                Visibility(
                  // visible: CurrentUserData.verified == false &&
                  //     CurrentUserData.followers.length >= 500,
                  child: AccountSettingCard(
                    onTap: () => AppPages.to(
                      context: context,
                      path: AppRoutes.verification,
                    ),
                    text: 'Verification',
                  ),
                ),
                AccountSettingCard(
                  onTap: () => AppPages.to(
                    context: context,
                    path: AppRoutes.changePassword,
                  ),
                  text: 'Change password',
                ),
                AccountSettingCard(
                  onTap: () => AppPages.to(
                    context: context,
                    path: AppRoutes.deleteAccount,
                  ),
                  text: 'Delete account',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
