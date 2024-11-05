import '/features/auth/presentation/views/add_personal_picture_screen.dart';
import '/features/auth/presentation/views/forgot_password_screen.dart';
import '/features/main_home/presentation/views/main_home_screen.dart';
import '/features/auth/presentation/views/register_screen.dart';
import '/features/auth/presentation/views/login_screen.dart';
import 'package:go_router/go_router.dart';
import '/core/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import '/initial_screen.dart';

class AppPages {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initialScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.initialScreen,
        builder: (context, state) => const InitialScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainHome,
        builder: (context, state) => const MainHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.addPersonalPicture,
        builder: (context, state) => const AddPersonalPictureScreen(),
      ),
    ],
  );
  static void to({
    required String path,
    required BuildContext context,
    Object? data,
  }) {
    GoRouter.of(context).push(path, extra: data);
  }

  static void off({
    required String path,
    required BuildContext context,
    Object? data,
  }) {
    GoRouter.of(context).go(path, extra: data);
  }

  static void offAll({
    required String path,
    required BuildContext context,
    Object? data,
  }) {
    GoRouter.of(context).go(
      path,
      extra: {'reset': true, 'data': data},
    );
  }

  static void back(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
