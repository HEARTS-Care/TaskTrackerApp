import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfileProvider extends ChangeNotifier {
  final GetStorage _storage = GetStorage();

  String _username = '';
  String _email = '';
  String _password = '';

  String get username => _username;
  String get email => _email;
  String get password => _password;

  ProfileProvider() {
    _loadUserProfile();
  }

  void _loadUserProfile() {
    var user = _storage.read("user");
    if (user != null) {
      _username = user["username"] ?? '';
      _email = user["email"] ?? '';
      _password = user["password"] ?? '';
      notifyListeners();
    }
  }

  void updateProfile(String newUsername, String newEmail) {
    _username = newUsername;
    _email = newEmail;

    Map<String, dynamic> updatedUser = {
      "username": _username,
      "email": _email,
      "password": _password
    };

    _storage.write("user", updatedUser);
    notifyListeners();
  }
}
