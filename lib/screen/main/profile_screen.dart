import 'package:flutter/material.dart';
import 'package:nasifay/components/form_component.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/profile_management.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ElevatedButton(
              onPressed: () {
                final profileProvider =
                    Provider.of<ProfileProvider>(context, listen: false);
                profileProvider.updateProfile(
                  _usernameController.text,
                  _emailController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully!')),
                );
                Navigator.pop(context);
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
