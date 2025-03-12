import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfileProvider extends ChangeNotifier {
  final GetStorage _storage = GetStorage();

  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  ProfileProvider() {
    _loadUserProfile();
  }

  void _loadUserProfile() {
    var user = _storage.read("user");
    if (user != null) {
      _username = user["username"] ?? '';
      _email = user["email"] ?? '';
      notifyListeners();
    }
  }

  void updateProfile(String newUsername, String newEmail) {
    _username = newUsername;
    _email = newEmail;

    Map<String, dynamic> updatedUser = {
      "username": _username,
      "email": _email,
    };

    _storage.write("user", updatedUser);
    notifyListeners();
  }
}
