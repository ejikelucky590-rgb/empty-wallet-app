import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'core/theme.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      // Keys extracted from your google-services.json screenshot
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyCK9zkWM_mb5yDP9SrEY3shvdpKaatjNas",
          appId: "1:202954242650:android:4959d392a530f74eb77663", // Using Android ID as fallback for web init
          messagingSenderId: "202954242650",
          projectId: "com-dovemusic-app",
          storageBucket: "com-dovemusic-app.firebasestorage.app",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    debugPrint("Firebase connection skipped or failed: $e");
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
