import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.teal;
  static const secondary = Colors.tealAccent;
  static const textPrimary = Colors.black87;
  static const cardBackground = Color(0xFFF1F1F1);
}

class GreetingUtil {
  static String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
}