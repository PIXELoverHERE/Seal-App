import 'package:flutter/foundation.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadAudio(String url) {
  if (kIsWeb) {
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "seal_agreement.wav")
      ..click();
  }
}
