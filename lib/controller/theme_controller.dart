import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  final GetStorage _storage = GetStorage();

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final isDarkMode = _storage.read<bool>('isDarkMode') ?? false;
    themeMode.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    log("IsDarkMode: $isDarkMode");
    await _storage.write('isDarkMode', isDarkMode);
    themeMode.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
