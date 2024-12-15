import '/features/posts/presentation/manager/add_post_cubit/add_post_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddPostViewButtomAddMedia extends StatelessWidget {
  const AddPostViewButtomAddMedia({super.key});

  @override
  Widget build(BuildContext context) {
    AddPostCubit blocAccess = BlocProvider.of<AddPostCubit>(context);
    return IconButton(
      onPressed: () => blocAccess.uploadImageFromDevice(),
      icon: const Icon(FontAwesomeIcons.paperclip),
    );
  }
}
