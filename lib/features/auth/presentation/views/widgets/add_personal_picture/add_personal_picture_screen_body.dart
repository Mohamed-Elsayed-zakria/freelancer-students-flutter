import '/features/auth/presentation/views/widgets/add_personal_picture/add_personal_picture_screen_custom_appbar.dart';
import '/features/auth/presentation/views/widgets/add_personal_picture/add_personal_picture_custom_circle_avatar.dart';
import 'add_personal_picture_screen_buttom_continue.dart';
import 'package:flutter/material.dart';

class AddPersonalPictureScreenBody extends StatelessWidget {
  const AddPersonalPictureScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AddPersonalPictureScreenCustomAppbar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                AddPersonalPictureCustomCircleAvatar(),
                SizedBox(height: 10),
                AddPersonalPictureScreenButtomContinue(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
