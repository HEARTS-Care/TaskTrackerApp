import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nasifay/components/form_component.dart';
import 'package:nasifay/components/primary_button.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/auth_controller.dart';
import 'package:nasifay/controller/profile_management.dart';
import 'package:nasifay/controller/theme_controller.dart';
import 'package:provider/provider.dart';
// import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final AuthController authController = Get.find<AuthController>();
  final ThemeController themeController = Get.find<ThemeController>();

  String _selectedLanguage = 'English'; // Default language

  @override
  void initState() {
    super.initState();

    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    _usernameController.text = profileProvider.username;
    _emailController.text = profileProvider.email;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    FormComponents formComponents = FormComponents(context: context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Profile',
              style: theme.typography.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formComponents.buildNormalTextField(
                    _usernameController,
                    Text(
                      'Username',
                      style: theme.typography.titleSmall
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email is required!';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  formComponents.buildNormalTextField(
                    _emailController,
                    Text(
                      'Email',
                      style: theme.typography.titleSmall
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (value == null || value.isEmpty) {
                        return 'email is required!';
                      }

                      // Validate email format
                      if (!emailRegex.hasMatch(_emailController.text.trim())) {
                        return 'Invalid email format.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  PrimaryButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final profileProvider = Provider.of<ProfileProvider>(
                            context,
                            listen: false);
                        profileProvider.updateProfile(
                          _usernameController.text,
                          _emailController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Profile updated successfully! Please Refresh the App!')),
                        );
                      }
                    },
                    color: theme.primary,
                    child: Text(
                      'Update Profile',
                      style: theme.typography.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Preferenece',
              style: theme.typography.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language: ',
                  style: theme.typography.bodyMedium,
                ),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  items: <String>['English', 'Amharic']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                      // Handle language change here (You can implement localization)
                    });
                  },
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode: ',
                  style: theme.typography.bodyMedium,
                ),
                Switch(
                  activeColor: theme.primary,
                  activeTrackColor: theme.primary.withOpacity(0.5),
                  inactiveTrackColor: Colors.grey.withOpacity(0.5),
                  inactiveThumbColor: Colors.grey,
                  value: themeController.themeMode.value == ThemeMode.dark,
                  onChanged: (value) {
                    themeController.toggleTheme(value);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  authController.logout();
                },
                child: Text(
                  'Log Out',
                  style:
                      theme.typography.titleMedium.copyWith(color: theme.error),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
