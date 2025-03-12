import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/auth_controller.dart';
import 'package:nasifay/controller/profile_management.dart';
import 'package:nasifay/screen/auth/login.dart';
import 'package:nasifay/screen/auth/sign_up.dart';
import 'package:nasifay/screen/main/landing_page.dart';
import 'package:nasifay/screen/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProfileProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Scheduler',
      initialRoute:
          authController.storage.read("user") != null ? "/home" : "/onboarding",
      theme: LightModeTheme().themeData,
      darkTheme: DarkModeTheme().themeData,
      getPages: [
        GetPage(name: "/home", page: () => LandingPage()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/signup", page: () => SignUp()),
        GetPage(name: "/onboarding", page: () => Onboarding()),
      ],
    );
  }
}
