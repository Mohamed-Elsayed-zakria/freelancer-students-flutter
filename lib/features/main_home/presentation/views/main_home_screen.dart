import 'package:flutter_iconly/flutter_iconly.dart';
import 'widgets/main_home_screen_body.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.kSurfaceColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: pageNumber,
        onTap: (value) {
          setState(() {
            pageNumber = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBroken.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBroken.notification),
            label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBroken.category),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBroken.setting),
            label: 'Settings',
          ),
        ],
      ),
      body: MainHomeScreenBody(pageNumber: pageNumber),
    );
  }
}
