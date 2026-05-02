import 'package:flutter/material.dart';

class DoveColors {
  static const Color cyan = Color(0xFF25F4EE);
  static const Color red = Color(0xFFFE2C55);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF86878B);
  static const Color darkGrey = Color(0xFF121212);
}

class DoveTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DoveColors.black,
      primaryColor: DoveColors.white,
      colorScheme: const ColorScheme.dark(
        primary: DoveColors.white,
        secondary: DoveColors.cyan,
        surface: DoveColors.darkGrey,
        error: DoveColors.red,
      ),
    );
  }
}
