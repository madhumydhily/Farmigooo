import 'package:flutter/material.dart';

/// Design tokens and color palette for FARMIGO app.
abstract class AppColors {
  // Brand Palette - Earth & Growth Tones
  static const Color primary = Color(0xFF1E88E5); // Modern Tech Azure / Growth Blue
  static const Color primaryGreen = Color(0xFF2E7D32); // Deep Forest Green
  static const Color accentAmber = Color(0xFFFFA000); // Harvest Amber
  static const Color accentTeal = Color(0xFF00897B); // Precision Ag Teal

  // Light Mode Colors
  static const Color lightBackground = Color(0xFFF8FAF9);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF1B2A20);
  static const Color lightTextSecondary = Color(0xFF5E6E63);
  static const Color lightBorder = Color(0xFFE0E6E2);

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF121B16);
  static const Color darkSurface = Color(0xFF1B2821);
  static const Color darkCard = Color(0xFF23322A);
  static const Color darkTextPrimary = Color(0xFFF0F4F1);
  static const Color darkTextSecondary = Color(0xFF9FB0A5);
  static const Color darkBorder = Color(0xFF2C3E33);

  // Status & Feedback
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF0288D1);

  // Layout Spacing & Radius Constants
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
}
