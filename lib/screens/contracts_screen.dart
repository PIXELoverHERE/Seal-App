import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text('Contracts', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(child: Text('Contracts coming soon!', style: TextStyle(color: Color(0xFF6A798C)))),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }
}
