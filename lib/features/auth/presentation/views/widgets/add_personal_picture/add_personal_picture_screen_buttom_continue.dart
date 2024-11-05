import '/features/auth/presentation/manager/add_personal_picture_cubit/add_personal_picture_cubit.dart';
import '/features/auth/presentation/manager/add_personal_picture_cubit/add_personal_picture_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class AddPersonalPictureScreenButtomContinue extends StatelessWidget {
  const AddPersonalPictureScreenButtomContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPersonalPictureCubit, AddPersonalPictureState>(
      listener: (context, state) {
        if (state is UploadImageToDatabaseSuccess) {
          AppPages.offAll(
            path: AppRoutes.mainHome,
            context: context,
          );
        } else if (state is UploadImageToDatabaseFailure) {
          ShowToast.show(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is UploadImageToDatabaseLoading,
          text: "Continue",
          onPressed: () {
            AddPersonalPictureCubit blocAccess =
                BlocProvider.of<AddPersonalPictureCubit>(context);
            if (blocAccess.addDetailsImgPath != null) {
              blocAccess.uploadImageToDatabase();
            } else {
              ShowToast.show(msg: "No image selected");
            }
          },
        );
      },
    );
  }
}
