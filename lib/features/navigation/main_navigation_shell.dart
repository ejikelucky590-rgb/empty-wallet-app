import 'package:flutter/material.dart';
import '../../core/theme.dart';

class MainNavigationShell extends StatelessWidget {
  const MainNavigationShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoveColors.black,
      body: const Center(
        child: Text(
          "DOVE HOME",
          style: TextStyle(color: DoveColors.cyan, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DoveColors.black,
        selectedItemColor: DoveColors.cyan,
        unselectedItemColor: DoveColors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'WAIVE'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'HUB'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'RANK'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ME'),
        ],
      ),
    );
  }
}
