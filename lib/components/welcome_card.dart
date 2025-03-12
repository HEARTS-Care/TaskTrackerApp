import 'package:flutter/material.dart';
import 'package:nasifay/config/theme/app_theme.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Task Manager',
            style: theme.typography.labelLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/on1.png',
            // color: theme.secondaryBackground,
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}
