import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nasifay/screen/main/home_screen.dart';
import 'package:nasifay/screen/main/landing_page.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  Future<void> signup(String username, String email, String password) async {
    isLoading.value = true;

    try {
      var existingUser = storage.read("user");
      if (existingUser != null && existingUser["email"] == email) {
        Get.snackbar("Error", "User already exists. Please log in.");
        isLoading.value = false;
        return;
      }

      Map<String, dynamic> userData = {
        "username": username,
        "email": email,
        "password": password,
      };

      storage.write("user", userData);
      isLoggedIn.value = true;

      Get.offAll(() => LandingPage());
      Get.snackbar("Success", "Account created successfully!",
          colorText: Color(0xFFFFFFFF));
    } catch (e) {
      Get.snackbar("Error", "Failed to create account. Please try again.",
          colorText: Color(0xFFFFFFFF));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    try {
      var storedUser = storage.read("user");
      log(storedUser.toString());
      if (storedUser != null &&
          storedUser["email"] == email &&
          storedUser["password"] == password) {
        isLoggedIn.value = true;
        Get.offAll(() => LandingPage());
        Get.snackbar("Success", "Login successful!");
      } else {
        Get.snackbar("Error", "Invalid email or password.",
            colorText: Color(0xFFFFFFFF));
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to login. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
    // storage.remove("user");
    Get.offAllNamed("/login");
  }

  void checkAuthStatus() {
    var user = storage.read("user");
    if (user != null) {
      isLoggedIn.value = true;
    }
  }
}
