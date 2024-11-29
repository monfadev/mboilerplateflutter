import 'package:flutter/services.dart';

class Heptic {
  static Future<void> medium() async {
    await HapticFeedback.mediumImpact();
  }
}
