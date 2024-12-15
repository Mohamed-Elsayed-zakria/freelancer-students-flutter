import '/features/posts/presentation/manager/add_post_cubit/add_post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class AddPostViewCustomDropDownMenu extends StatefulWidget {
  const AddPostViewCustomDropDownMenu({super.key});

  @override
  State<AddPostViewCustomDropDownMenu> createState() =>
      _AddPostViewCustomDropDownMenuState();
}

class _AddPostViewCustomDropDownMenuState
    extends State<AddPostViewCustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    AddPostCubit blocAccess = BlocProvider.of<AddPostCubit>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: blocAccess.selectItem,
        items: blocAccess.listItem
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    item,
                    style: AppStyle.kTextStyle18,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (String? item) {
          setState(() {
            blocAccess.selectItem = item!;
          });
        },
      ),
    );
  }
}
