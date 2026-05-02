import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAuth();
  }

  void _navigateToAuth() async {
    // Wait for 3 seconds so the user sees your brand
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const AuthScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoveColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "DOVE",
              style: TextStyle(
                color: DoveColors.white,
                fontSize: 50,
                fontWeight: FontWeight.w900,
                letterSpacing: 15,
              ),
            ),
            const SizedBox(height: 20),
            // This is a Flutter Widget, not an HTML tag
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: DoveColors.cyan,
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
