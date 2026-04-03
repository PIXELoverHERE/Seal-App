import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/custom_bottom_nav.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
              const Text('STEP 2: VERIFICATION', style: TextStyle(color: Color(0xFF007556), fontWeight: FontWeight.bold, fontSize: 10)),
              const SizedBox(height: 8),
              const Text(
                'Review Your\nAgreement',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF003366), height: 1.2),
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(backgroundColor: Color(0xFF42D7A5), radius: 16, child: Icon(Icons.check, color: Colors.white, size: 20)),
                        const SizedBox(width: 16),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                          Text('Agreement Summary', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF003366), fontSize: 16)),
                          Text('Transcribed from audio recording', style: TextStyle(color: Color(0xFF6A798C), fontSize: 12)),
                        ])),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildSummaryItem('1', 'WORK DESCRIPTION', 'Farm Labour: Harvest collection and sorting in North Field.'),
                    const SizedBox(height: 24),
                    _buildSummaryItem('2', 'AGREED RATE', '500 / day (Paid daily upon completion)'),
                    const SizedBox(height: 24),
                    _buildSummaryItem('3', 'DURATION', '5 Full Days (Starting Monday, Oct 14)'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AppState>(context, listen: false).addAgreement(
                    AgreementItem(
                      icon: Icons.landscape_outlined,
                      title: 'Farm Labour - North Field',
                      date: 'Oct 14',
                      status: 'Verified on Blockchain',
                      amount: '\$2,500.00',
                      isVerified: true,
                    ),
                  );
                  Navigator.pushReplacementNamed(context, '/secured');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003366),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Confirm & Secure', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }

  Widget _buildSummaryItem(String number, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: const Color(0xFFE5ECF2), borderRadius: BorderRadius.circular(6)),
          child: Text(number, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF003366), fontSize: 12)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF6A798C), fontWeight: FontWeight.bold, fontSize: 10)),
              const SizedBox(height: 4),
              Text(description, style: const TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.w600, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
