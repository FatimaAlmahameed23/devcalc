import 'package:flutter/material.dart';

/// Central color palette for DevCalc.
/// All colors in the app come from here — never hardcode colors elsewhere.
abstract final class AppColors {
  // --- Brand / Accent ---
  static const primary = Color(0xFF00FF9C);
  static const secondary = Color(0xFF00D4FF);

  // --- Dark Theme ---
  static const darkBackground = Color(0xFF0D0D0D);
  static const darkSurface = Color(0xFF1A1A1A);
  static const darkSurfaceVariant = Color(0xFF252525);
  static const darkBorder = Color(0xFF2E2E2E);
  static const darkTextPrimary = Color(0xFFE0E0E0);
  static const darkTextSecondary = Color(0xFF888888);

  // --- Light Theme ---
  static const lightBackground = Color(0xFFF5F5F5);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceVariant = Color(0xFFEEEEEE);
  static const lightBorder = Color(0xFFDDDDDD);
  static const lightTextPrimary = Color(0xFF1A1A1A);
  static const lightTextSecondary = Color(0xFF666666);

  // --- Semantic ---
  static const error = Color(0xFFFF5555);
  static const success = Color(0xFF00FF9C);
  static const warning = Color(0xFFFFB86C);
}
