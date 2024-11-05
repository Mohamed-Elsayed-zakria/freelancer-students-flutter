import '/features/main_home/presentation/views/main_home_screen.dart';
import '/features/auth/presentation/views/login_screen.dart';
import 'core/models/user_credentials.dart';
import 'core/services/auth_services.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return checkUserIsLogin() ? const MainHomeScreen() : const LoginScreen();
  }

  bool checkUserIsLogin() {
    UserCredentials? credentials = AuthServices.readCredentials();
    if (credentials != null &&
        credentials.token != null &&
        credentials.token!.isNotEmpty) {
      return true;
    }
    return false;
  }
}
