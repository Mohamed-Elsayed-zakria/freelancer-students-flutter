import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_cubit.dart';
import '/features/profile/presentation/manager/profile_edite_cubit/profile_edite_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/features/profile/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/api_end_point.dart';
import '/core/widgets/custom_buttom.dart';
import 'profile_custom_buttom_edite.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';

class ProfileEditeCoverPhoto extends StatelessWidget {
  final ProfileModel userData;

  const ProfileEditeCoverPhoto({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final size = SizeScreen.size(context: context);
    return BlocConsumer<ProfileEditeCubit, ProfileEditeState>(
      listener: (context, state) {
        if (state is ProfileEditeFealure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        ProfileEditeCubit blocAccess = context.read<ProfileEditeCubit>();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileCustomButtomEdite(
                  onPressed: () => blocAccess.chooseImageCoverFromGalary(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    "cover Photo",
                    style: AppStyle.kTextStyle18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                blocAccess.updateImgPathCover == null
                    ? Container(
                        height: size.height * 0.20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              '${APIEndPoint.mediaBaseUrl}${userData.coverPhoto}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: size.height * 0.20,
                          width: double.infinity,
                          child: Image.file(
                            blocAccess.updateImgPathCover!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                const SizedBox(height: 10),
                Visibility(
                  visible: blocAccess.updateImgPathCover != null,
                  child: AbsorbPointer(
                    absorbing: state is ProfileEditeLoading,
                    child: CustomButton(
                      text: 'Edite',
                      onPressed: () => blocAccess.uploadImageCover(
                        imgPath: blocAccess.updateImgPathCover!.path,
                        userId: userData.personalUid,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
