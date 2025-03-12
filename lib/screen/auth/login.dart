import 'package:flutter/material.dart';
import 'package:nasifay/components/welcome_card.dart';
import 'package:nasifay/config/theme/app_theme.dart';
import 'package:nasifay/screen/auth/widget/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.primary,
      body: SafeArea(
        child: Column(
          children: [
            WelcomeCard(),
            SizedBox(
              height: 10,
            ),
            LoginForm()
          ],
        ),
      ),
    );
  }
}
