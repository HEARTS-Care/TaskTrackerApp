import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasifay/components/form_component.dart';
import 'package:nasifay/components/primary_button.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/controller/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    FormComponents formComponents = FormComponents(context: context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: theme.primaryBackground,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: theme.typography.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Enter your details below",
                  style: theme.typography.titleSmall
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: formComponents.buildNormalTextField(
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
                          if (!emailRegex
                              .hasMatch(_emailController.text.trim())) {
                            return 'Invalid email format.';
                          }
                          return null;
                        },
                      ), // Dynamically show Email or Phone input
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                formComponents.buildPasswordField(
                  _passwordController,
                  Text(
                    'Password',
                    style: theme.typography.titleSmall
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    // final passwordRegex =
                    //     RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
                    if (value == null || value.isEmpty) {
                      return 'password is required!';
                    }

                    // if (!passwordRegex
                    //     .hasMatch(_passwordController.text.trim())) {
                    //   return 'Password must be at least 8 characters long and contain both letters and numbers.';
                    // }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        authController.login(_emailController.text.trim(),
                            _passwordController.text.trim());
                      }
                    },
                    color: theme.primary,
                    child: Obx(() {
                      return authController.isLoading.value
                          ? CircularProgressIndicator(
                              color: theme.secondary,
                            )
                          : Text(
                              'Login',
                              style: theme.typography.labelMedium,
                            );
                    })),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: theme.typography.bodyMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/signup'),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: theme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
