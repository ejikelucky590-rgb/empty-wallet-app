import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We initialize Firebase but allow it to fail gracefully if 
  // the config files aren't ready yet
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase not configured yet: $e");
  }
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
