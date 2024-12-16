import 'features/home/presentation/manager/home_get_posts_cubit/home_get_posts_cubit.dart';
import 'features/home/data/repository/implement/home_implement.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator.dart';
import 'package:flutter/foundation.dart';
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
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeGetPostsCubit(HomeImplement()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Freelancer',
        theme: AppStyle.appTheme(),
        routerConfig: AppPages.router,
      ),
    );
  }
}
