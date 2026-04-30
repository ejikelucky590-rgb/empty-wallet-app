import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

void main() {
  runApp(const DoveMusicApp());
}

class DoveMusicApp extends StatelessWidget {
  const DoveMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flappingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _flappingAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuad,
    );

    Timer(const Duration(seconds: 5), () {
      print("Splash finished");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5FA),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double floatOffset = math.sin(_controller.value * math.pi * 2) * 20.0;
                return Transform.translate(
                  offset: Offset(0, floatOffset - 50.0),
                  child: CustomPaint(
                    painter: DovePainter(
                      color: const Color(0xFF4A90E2),
                      wingPosition: _flappingAnimation.value,
                    ),
                    size: const Size(200, 150),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "DOVE MUSIC",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4.0,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 60),
                  const SizedBox(
                    width: 250,
                    height: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4A90E2)),
                        backgroundColor: Color(0xFFD6E4F0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DovePainter extends CustomPainter {
  final Color color;
  final double wingPosition;
  DovePainter({required this.color, required this.wingPosition});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final double midX = size.width / 2;
    final double midY = size.height / 2;
    double dynamicCurveOffset = math.sin(wingPosition * math.pi) * 35.0;

    Path path = Path();
    path.moveTo(midX, midY + 10);
    path.quadraticBezierTo(midX + 60, midY - 40 + dynamicCurveOffset, midX + 90, midY - 5);
    path.lineTo(midX + 55, midY + 10);
    path.lineTo(midX - 55, midY + 10);
    path.quadraticBezierTo(midX - 60, midY - 40 + dynamicCurveOffset, midX, midY + 10);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DovePainter oldDelegate) => true;
}
