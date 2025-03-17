import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/auth_controller.dart';
import 'package:nasifay/controller/profile_management.dart';
import 'package:nasifay/controller/theme_controller.dart';
import 'package:nasifay/screen/auth/login.dart';
import 'package:nasifay/screen/auth/sign_up.dart';
import 'package:nasifay/screen/main/landing_page.dart';
import 'package:nasifay/screen/onboarding/onboarding.dart';
import 'package:nasifay/service/notice_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoticeService().initNotification();

  await GetStorage.init();
  final themeController = Get.put(ThemeController());

  if (!await FlutterOverlayWindow.isPermissionGranted()) {
    log("Requesting Permissions");
    await FlutterOverlayWindow.requestPermission();
  }
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProfileProvider())],
    child: MyApp(themeController: themeController),
  ));
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Container(
          color: Colors.red,
          child: const Text("My Overlay"),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  MyApp({super.key, required this.themeController});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Scheduler',
        initialRoute: authController.storage.read("user") != null
            ? "/home"
            : "/onboarding",
        theme: LightModeTheme().themeData,
        darkTheme: DarkModeTheme().themeData,
        themeMode: themeController.themeMode.value,
        getPages: [
          GetPage(name: "/home", page: () => LandingPage()),
          GetPage(name: "/login", page: () => Login()),
          GetPage(name: "/signup", page: () => SignUp()),
          GetPage(name: "/onboarding", page: () => Onboarding()),
        ],
      );
    });
  }
}
