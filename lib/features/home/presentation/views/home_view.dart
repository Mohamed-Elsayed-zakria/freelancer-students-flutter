import '/features/home/presentation/manager/home_get_posts_cubit/home_get_posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/services/auth_services.dart';
import 'widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? userId;

  @override
  void initState() {
    userId = AuthServices.currentUserId();
    if (userId != null) {
      context.read<HomeGetPostsCubit>().fetchAllPosts(userId: userId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: RefreshIndicator(
        onRefresh: () =>
            context.read<HomeGetPostsCubit>().fetchAllPosts(userId: userId!),
        child: const HomeScreenBody(),
      ),
    );
  }
}
