import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_cubit.dart';
import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_state.dart';
import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'profile_custom_buttom_edite.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProfileEditeElbio extends StatelessWidget {
  final ProfileModel userData;

  const ProfileEditeElbio({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditeCubit, ProfileEditeState>(
      builder: (context, state) {
        ProfileEditeCubit blocAccess = context.read<ProfileEditeCubit>();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileCustomButtomEdite(
                  onPressed: () => _showDialog(context, blocAccess),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    "bio",
                    style: AppStyle.kTextStyle18,
                  ),
                ),
              ],
            ),
            Text(
              userData.bio,
              style: AppStyle.kTextStyle16,
            ),
            const SizedBox(height: 10),
            const Divider(),
          ],
        );
      },
    );
  }

  Future<dynamic> _showDialog(
    BuildContext context,
    ProfileEditeCubit blocAccess,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          backgroundColor: AppColors.kSurfaceColor,
          title: const Text("Edite bio"),
          content: Form(
            key: blocAccess.profileKeyLogin,
            child: CustomFormField(
              controller: blocAccess.getTextBio,
              validator: (value) {
                if (value!.isEmpty) {
                  return "bio field empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.multiline,
              label: "Bio",
              hintText: "Enter New Bio",
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                AppPages.back(context);
              },
              child: const Text(
                "Cancel",
                style: AppStyle.kTextStyle16,
              ),
            ),
            TextButton(
              onPressed: () {
                if (blocAccess.profileKeyLogin.currentState!.validate()) {
                  AppPages.back(context);
                  blocAccess.updateBio(
                    text: blocAccess.getTextBio.text,
                    userId: userData.personalUid,
                  );
                }
              },
              child: const Text(
                "Edit",
                style: AppStyle.kTextStyle16,
              ),
            ),
          ],
        );
      },
    );
  }
}
