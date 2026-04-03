import 'package:flutter/material.dart';

class AgreementItem {
  final IconData icon;
  final String title;
  final String date;
  final String status;
  final String amount;
  final bool isVerified;

  AgreementItem({
    required this.icon,
    required this.title,
    required this.date,
    required this.status,
    required this.amount,
    required this.isVerified,
  });
}

class AppState extends ChangeNotifier {
  List<AgreementItem> _agreements = [];

  List<AgreementItem> get agreements => _agreements;

  int get verifiedThisMonth => _agreements.where((a) => a.isVerified).length;
  int get pendingApprovals => _agreements.where((a) => !a.isVerified).length;
  
  String get trustScore => _agreements.isNotEmpty ? '98%' : '0%';

  void addAgreement(AgreementItem item) {
    _agreements.insert(0, item);
    notifyListeners();
  }
}
