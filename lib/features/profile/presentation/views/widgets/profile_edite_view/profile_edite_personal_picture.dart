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
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProfileEditePersonalPicture extends StatelessWidget {
  final ProfileModel userData;

  const ProfileEditePersonalPicture({
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
                  onPressed: () => blocAccess.chooseImagePictureFromGalary(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    'personal picture',
                    style: AppStyle.kTextStyle18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                blocAccess.updateImgPathPicture == null
                    ? CircleAvatar(
                        radius: size.width * .18,
                        backgroundColor: AppColors.kBackgroundColor,
                        child: CircleAvatar(
                          backgroundColor: AppColors.kSurfaceColor,
                          radius: size.width * .17,
                          backgroundImage: CachedNetworkImageProvider(
                            '${APIEndPoint.mediaBaseUrl}${userData.personalPicture}',
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Image.file(
                          blocAccess.updateImgPathPicture!,
                          width: size.width * .4,
                          height: size.width * .4,
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(height: 10),
                Visibility(
                  visible: blocAccess.updateImgPathPicture != null,
                  child: AbsorbPointer(
                    absorbing: state is ProfileEditeLoading,
                    child: CustomButton(
                      text: 'Edite',
                      onPressed: () => blocAccess.uploadImagePicture(
                        imgPath: blocAccess.updateImgPathPicture!.path,
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
