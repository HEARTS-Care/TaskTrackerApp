import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/bottom_nav_controller.dart';
import 'package:nasifay/screen/main/add_task_screen.dart';
import 'package:nasifay/screen/main/home_screen.dart';
import 'package:nasifay/screen/main/profile_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    final BottomNavController navController = Get.put(BottomNavController());

    String getTitle(BottomNavState state) {
      switch (state) {
        case BottomNavState.home:
          return 'Home';
        case BottomNavState.add:
          return 'Add';
        case BottomNavState.profile:
          return 'Profile';
      }
    }

    Widget getCurrentScreen(BottomNavState state) {
      switch (state) {
        case BottomNavState.home:
          return HomeScreen();
        case BottomNavState.add:
          return AddTaskScreen();
        case BottomNavState.profile:
          return ProfileScreen();
      }
    }

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      appBar: AppBar(
        elevation: 1,
        title: Obx(() => Text(
              getTitle(navController.selectedItem.value),
              style: theme.typography.headlineSmall,
            )),
        centerTitle: true,
      ),
      body: Obx(() => getCurrentScreen(navController.selectedItem.value)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex:
                BottomNavState.values.indexOf(navController.selectedItem.value),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: theme.primary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_chart_rounded),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_suggest_outlined),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              navController.selectItem(BottomNavState.values[index]);
            },
          )),
    );
  }
}
