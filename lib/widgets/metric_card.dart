import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color backgroundColor;

  const MetricCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.titleColor = const Color(0xFF6A798C),
    this.valueColor = const Color(0xFF003366),
    this.iconColor = const Color(0xFF007556),
    this.iconBackgroundColor = const Color(0xFFE2F4EE),
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
