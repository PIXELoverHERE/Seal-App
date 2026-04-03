import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/metric_card.dart';
import '../widgets/recent_agreement_card.dart';
import '../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Record Button Top Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Color(0xFF003366),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'SEAL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xFF1A4775),
                              radius: 20,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFF1A4775),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.notifications_none, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Your Word is Your Contract',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Capture agreements instantly\nwith your voice. Secure, verified,\nand permanent.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF99B2CC),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Record Button
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/record'),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF004080),
                          border: Border.all(color: const Color(0xFF004D99), width: 8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.mic, color: Color(0xFF29C39B), size: 40),
                            SizedBox(height: 8),
                            Text(
                              'Record New\nAgreement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Metrics Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: [
                      MetricCard(
                        icon: Icons.verified_user_outlined,
                        title: 'Verified This Month',
                        value: '${appState.verifiedThisMonth}',
                      ),
                      const SizedBox(width: 16),
                      MetricCard(
                        icon: Icons.history,
                        title: 'Pending Approvals',
                        value: '${appState.pendingApprovals}',
                        iconColor: const Color(0xFFCC7722),
                        iconBackgroundColor: const Color(0xFFFFF4E5),
                      ),
                      const SizedBox(width: 16),
                      MetricCard(
                        icon: Icons.shield_outlined,
                        title: 'Trust Score',
                        value: appState.trustScore,
                        iconColor: const Color(0xFF003366),
                        iconBackgroundColor: const Color(0xFFE5ECF2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Recent Agreements List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent\nAgreements',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003366),
                            height: 1.2,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Text(
                                'View\nAll',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF003366),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward, size: 16, color: Color(0xFF003366)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (appState.agreements.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          'No recent agreements available. Tap the microphone to record your first securely verified agreement today!',
                          style: TextStyle(color: Color(0xFF6A798C), height: 1.5),
                        ),
                      )
                    else
                      ...appState.agreements.map((agreement) => RecentAgreementCard(
                            icon: agreement.icon,
                            title: agreement.title,
                            date: agreement.date,
                            status: agreement.status,
                            amount: agreement.amount,
                            isVerified: agreement.isVerified,
                          )),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}
