import 'package:flutter/material.dart';
import 'package:nasifay/config/theme/theme_data_factory.dart';

import 'app_typography.dart';

abstract class AppTheme {
  static AppTheme of(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return themeMode == Brightness.dark ? DarkModeTheme() : LightModeTheme();
  }

  late Brightness brightness;
  late Color primary;
  late Color secondary;

  late Color primaryText;
  late Color secondaryText;

  late Color primaryBackground;
  late Color secondaryBackground;

  late LinearGradient primaryBackgroundGradient;

  late Color warning;
  late Color error;

  AppTypography get typography => ThemeTypography(this);
  ThemeData get themeData => ThemeDataFactory.toThemeData(this);
}

class LightModeTheme extends AppTheme {
  @override
  Brightness get brightness => Brightness.light;
  @override
  Color get primary => const Color(0xFF6a2300);
  @override
  Color get secondary => const Color(0xFFFFFFFF);

  @override
  Color get primaryText => const Color(0xFF000000);
  @override
  Color get secondaryText => const Color(0xFFFFFFFF);

  @override
  Color get primaryBackground => const Color(0xFFFFFFFF);
  @override
  Color get secondaryBackground => const Color(0xFF000000);
  @override
  LinearGradient get primaryBackgroundGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 0, 196, 196), Color(0xFF008080)],
      );

  @override
  Color get warning => const Color(0xFFF9CF58);
  @override
  Color get error => const Color(0xFFE50000);
}

class DarkModeTheme extends AppTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primary => const Color(0xFFFFFFFF);
  @override
  Color get secondary => const Color(0xFF1C1C3B);

  @override
  Color get primaryText => const Color(0xFFFFFFFF);
  @override
  Color get secondaryText => const Color(0xFF000000);

  @override
  Color get primaryBackground => const Color(0xFF000000);
  @override
  Color get secondaryBackground => const Color(0xFFFFFFFF);
  @override
  LinearGradient get primaryBackgroundGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1F1B24), Color(0xFF121212)],
      );

  @override
  Color get warning => const Color(0xFFF9CF58);
  @override
  Color get error => const Color(0xFFE50000);
}
