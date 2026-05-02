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
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        );
      }
    });
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
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: 12,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: DoveColors.cyan,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
