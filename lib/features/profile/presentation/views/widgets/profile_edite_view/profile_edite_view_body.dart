import '/features/profile/data/models/profile_model.dart';
import 'profile_edite_custom_linear_progress.dart';
import 'profile_edite_personal_picture.dart';
import 'profile_edite_cover_photo.dart';
import 'package:flutter/material.dart';
import 'profile_edite_elbio.dart';

class ProfileEditeViewBody extends StatelessWidget {
  final ProfileModel userData;
  const ProfileEditeViewBody({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Edite Profile'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const ProfileEditeCustomLinearProgress(),
                ProfileEditePersonalPicture(
                  userData: userData,
                ),
                ProfileEditeCoverPhoto(
                  userData: userData,
                ),
                ProfileEditeElbio(
                  userData: userData,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
