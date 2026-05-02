import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Try to initialize Firebase, but don't let it crash the app if it fails
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
  }
  
  runApp(const DoveMusicApp());
}

class DoveMusicApp extends StatelessWidget {
  const DoveMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dove Music',
      theme: DoveTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
