import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const DoveMusicApp());
}

class DoveMusicApp extends StatelessWidget {
  const DoveMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DoveTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
