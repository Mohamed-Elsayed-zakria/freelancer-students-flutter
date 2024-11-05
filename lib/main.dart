import 'core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'core/config/hive_config.dart';
import 'core/config/dio_config.dart';
import 'core/routes/app_pages.dart';
import 'core/constant/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupLocator().setup();
  DioConfig().setupDio();
  await HiveConfig.initHive();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Freelancer App',
      theme: AppStyle.appTheme(),
      routerConfig: AppPages.router,
    );
  }
}
