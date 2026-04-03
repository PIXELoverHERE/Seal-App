import 'package:flutter/material.dart';

class SecuredScreen extends StatelessWidget {
  const SecuredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text('SEAL', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF003366)),
        leading: const SizedBox(),
        actions: [
          IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(backgroundColor: Color(0xFF42D7A5), radius: 32, child: Icon(Icons.verified, color: Colors.white, size: 40)),
              const SizedBox(height: 24),
              const Text('SECURED', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
              const SizedBox(height: 8),
              const Text('Blockchain confirmation successful', style: TextStyle(color: Color(0xFF6A798C))),
              const SizedBox(height: 48),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text('SCAN TO VERIFY AGREEMENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF6A798C))),
                    const SizedBox(height: 24),
                    Container(
                      width: 200,
                      height: 200,
                      color: const Color(0xFF003366),
                      alignment: Alignment.center,
                      child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 100),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('BLOCKCHAIN HASH', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF6A798C))),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: const Color(0xFFE5ECF2), borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('0x8f2e...b9c3d', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.w600, fontSize: 12)),
                                    SizedBox(width: 8),
                                    Icon(Icons.copy, size: 12, color: Color(0xFF003366)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('TIMESTAMP', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF6A798C))),
                            SizedBox(height: 4),
                            Text('Oct 24, 2023 • 14:32:01', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold, fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
