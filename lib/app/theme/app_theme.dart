import 'package:devcalc/app/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Defines light and dark ThemeData for DevCalc.
/// Use AppTheme.dark or AppTheme.light when setting up MaterialApp.
abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    extensions: const [AppColorScheme.dark],
    primaryColor: AppColors.primary,
    fontFamily:
        'Courier New', // temporary — will replace with JetBrains Mono later
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurface,
      error: AppColors.error,
      onPrimary: AppColors.darkBackground,
      onSecondary: AppColors.darkBackground,
      onSurface: AppColors.darkTextPrimary,
      onError: AppColors.darkBackground,
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.darkBorder),
      ),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      centerTitle: false,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextPrimary),
      bodySmall: TextStyle(color: AppColors.darkTextSecondary),
      titleLarge: TextStyle(
        color: AppColors.darkTextPrimary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: AppColors.darkTextPrimary),
      titleSmall: TextStyle(color: AppColors.darkTextSecondary),
    ),
  );

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    extensions: const [AppColorScheme.light],
    primaryColor: AppColors.primary,
    fontFamily: 'Courier New',
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
      error: AppColors.error,
      onPrimary: AppColors.lightBackground,
      onSecondary: AppColors.lightBackground,
      onSurface: AppColors.lightTextPrimary,
      onError: AppColors.lightBackground,
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.lightBorder),
      ),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
      centerTitle: false,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextPrimary),
      bodySmall: TextStyle(color: AppColors.lightTextSecondary),
      titleLarge: TextStyle(
        color: AppColors.lightTextPrimary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: AppColors.lightTextPrimary),
      titleSmall: TextStyle(color: AppColors.lightTextSecondary),
    ),
  );
}
