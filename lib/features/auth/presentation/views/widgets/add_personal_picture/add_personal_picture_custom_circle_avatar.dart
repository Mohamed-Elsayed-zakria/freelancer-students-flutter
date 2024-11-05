import '/features/auth/presentation/manager/add_personal_picture_cubit/add_personal_picture_cubit.dart';
import '/features/auth/presentation/manager/add_personal_picture_cubit/add_personal_picture_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/assets.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class AddPersonalPictureCustomCircleAvatar extends StatelessWidget {
  const AddPersonalPictureCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Add photo',
          style: AppStyle.kTextStyle20,
        ),
        BlocBuilder<AddPersonalPictureCubit, AddPersonalPictureState>(
          builder: (context, state) {
            AddPersonalPictureCubit blocAccess =
                BlocProvider.of<AddPersonalPictureCubit>(context);
            return GestureDetector(
              onTap: () => blocAccess.uploadImageFromDevice(),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: CircleAvatar(
                      backgroundColor: blocAccess.addDetailsImgPath == null
                          ? AppColors.kOnSurfaceColor
                          : AppColors.kPrimaryColor,
                      radius: 90,
                      child: blocAccess.addDetailsImgPath == null
                          ? CircleAvatar(
                              radius: 85,
                              backgroundImage: AssetImage(Assets.avater),
                              backgroundColor: AppColors.kSurfaceColor,
                            )
                          : ClipOval(
                              child: Image.file(
                                blocAccess.addDetailsImgPath!,
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 28,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: blocAccess.addDetailsImgPath == null
                            ? AppColors.kOnSurfaceColor
                            : AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        color: AppColors.kSurfaceColor,
                        Icons.add_a_photo_outlined,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
