import '/core/widgets/show_up_animation.dart';
import 'register_screen_create_account.dart';
import 'register_screen_take_gender.dart';
import 'register_screen_take_data.dart';
import 'register_screen_take_age.dart';
import 'package:flutter/material.dart';
import 'register_screen_sign_in.dart';
import '/core/constant/assets.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            constraints: const BoxConstraints(
              maxHeight: 220,
              minHeight: 120,
            ),
            child: AspectRatio(
              aspectRatio: 3.8,
              child: ShowUp(
                delay: 10,
                child: Image.asset(
                  Assets.logo,
                ),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 10),
                RegisterScreenTakeData(),
                RegisterScreenTakeAge(),
                RegisterScreenTakeGender(),
                RegisterScreenSignIn(),
                RegisterCreateAccount(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
