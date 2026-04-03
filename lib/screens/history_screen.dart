import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text('History', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(child: Text('History coming soon!', style: TextStyle(color: Color(0xFF6A798C)))),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }
}
