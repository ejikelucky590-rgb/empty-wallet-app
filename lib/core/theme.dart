import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DoveColors.black,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme.dark(
        primary: DoveColors.white,
        secondary: DoveColors.cyan,
        surface: DoveColors.darkGrey,
        error: DoveColors.red,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: DoveColors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: DoveColors.cyan),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: DoveColors.grey),
        ),
      ),
    );
  }
}
