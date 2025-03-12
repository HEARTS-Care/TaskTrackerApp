import 'package:flutter/material.dart';
import 'package:nasifay/components/welcome_card.dart';
import 'package:nasifay/config/theme/app_theme.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
            SignupFrom()
          ],
        ),
      ),
    );
  }
}
