import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text('SEAL', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF003366)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Securely access your digital notary ledger and verified contracts.',
                style: TextStyle(fontSize: 14, color: Color(0xFF6A798C)),
              ),
              const SizedBox(height: 40),
              _buildInputLabel('PHONE NUMBER'),
              const SizedBox(height: 8),
              _buildTextField(hint: '+1 (555) 000-0000', icon: Icons.phone),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('VERIFICATION CODE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
                  Text('Resend Code', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF003366))),
                ],
              ),
              const SizedBox(height: 8),
              _buildTextField(hint: 'Enter 6-digit OTP', icon: Icons.lock_outline),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003366),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Log In Safely', style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.shield, color: Colors.white, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Phone Number?', style: TextStyle(color: Color(0xFF6A798C))),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shield, color: Color(0xFF29C39B)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Encrypted Connection', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF003366), fontSize: 12)),
                          Text('Your identity is protected by industry-grade cryptography.', style: TextStyle(color: Color(0xFF6A798C), fontSize: 11)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF003366)));
  }

  Widget _buildTextField({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF8C98A4)),
        prefixIcon: Icon(icon, color: const Color(0xFF8C98A4)),
        filled: true,
        fillColor: const Color(0xFFE5ECF2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
