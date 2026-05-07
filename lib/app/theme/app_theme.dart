import 'package:devcalc/app/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Defines light and dark ThemeData for DevCalc.
/// Use AppTheme.dark or AppTheme.light when setting up MaterialApp.
abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.surface,
    extensions: const [AppColorScheme.dark],
    primaryColor: AppColors.primary,
    fontFamily: 'JetBrainsMono',
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.gray150,
      error: AppColors.error,
      onPrimary: AppColors.surface,
      onSecondary: AppColors.surface,
      onSurface: Color(0xFFE6EDF3),
      onError: AppColors.surface,
    ),
    cardTheme: CardThemeData(
      color: AppColors.gray150,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.gray300),
      ),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: Color(0xFFE6EDF3),
      elevation: 0,
      centerTitle: false,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.gray300,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE6EDF3)),
      bodyMedium: TextStyle(color: Color(0xFFE6EDF3)),
      bodySmall: TextStyle(color: Color(0xFF8B949E)),
      titleLarge: TextStyle(
        color: Color(0xFFE6EDF3),
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: Color(0xFFE6EDF3)),
      titleSmall: TextStyle(color: Color(0xFF8B949E)),
    ),
  );

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightGray150,
    extensions: const [AppColorScheme.light],
    primaryColor: AppColors.lightPrimary,
    fontFamily: 'JetBrainsMono',
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      surface: AppColors.lightSurface,
      error: AppColors.lightError,
      onPrimary: AppColors.lightSurface,
      onSecondary: AppColors.lightSurface,
      onSurface: Color(0xFF1F2328),
      onError: AppColors.lightSurface,
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.lightGray300),
      ),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightGray150,
      foregroundColor: Color(0xFF1F2328),
      elevation: 0,
      centerTitle: false,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightGray300,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF1F2328)),
      bodyMedium: TextStyle(color: Color(0xFF1F2328)),
      bodySmall: TextStyle(color: Color(0xFF656D76)),
      titleLarge: TextStyle(
        color: Color(0xFF1F2328),
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: Color(0xFF1F2328)),
      titleSmall: TextStyle(color: Color(0xFF656D76)),
    ),
  );
}
