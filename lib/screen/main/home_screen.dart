import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => authController.logout(),
          )
        ],
      ),
      body: Center(
          child: Text(
        "Welcome!",
        style: theme.typography.headlineMedium,
      )),
    );
  }
}
