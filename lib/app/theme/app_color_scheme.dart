import 'package:devcalc/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color surface;
  final Color surfacebase; // the scaffold background
  final Color surfaceRaised; // pills, cards, buttons that sit on the scaffold
  final Color gray150;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;

  final Color primary;
  final Color primaryDark;
  final Color secondary;
  final Color error;

  final Color textPrimary;
  final Color textSecondary;
  final Color textNeutral;
  final Color textTertiary;
  final Color textInverse;
  final Color textInfo;
  final Color textWarning;
  final Color textError;
  final Color textSuccess;

  final Color skeletonBase;
  final Color skeletonHigh;

  final Color opBackground;
  final Color devBackground;
  final Color colorAccent;
  final Color toolsAccent;
  final Color historyAccent;
  final Color clearBackground;

  const AppColorScheme({
    required this.surface,
    required this.surfacebase,
    required this.surfaceRaised,
    required this.gray150,
    required this.gray200,
    required this.gray300,
    required this.gray400,
    required this.gray500,
    required this.primary,
    required this.primaryDark,
    required this.secondary,
    required this.error,
    required this.textPrimary,
    required this.textSecondary,
    required this.textNeutral,
    required this.textTertiary,
    required this.textInverse,
    required this.textInfo,
    required this.textWarning,
    required this.textError,
    required this.textSuccess,
    required this.skeletonBase,
    required this.skeletonHigh,
    required this.opBackground,
    required this.devBackground,
    required this.colorAccent,
    required this.toolsAccent,
    required this.historyAccent,
    required this.clearBackground,
  });

  // ─── Dark variant ───
  static const dark = AppColorScheme(
    surface: AppColors.surface,
    surfacebase: AppColors.surface,
    surfaceRaised: AppColors.gray150,
    gray150: AppColors.gray150,
    gray200: AppColors.gray200,
    gray300: AppColors.gray300,
    gray400: AppColors.gray400,
    gray500: AppColors.gray500,
    primary: AppColors.primary,
    primaryDark: AppColors.primaryDark,
    secondary: AppColors.secondary,
    error: AppColors.error,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textNeutral: AppColors.textNeutral,
    textTertiary: AppColors.textTertiary,
    textInverse: AppColors.textInverse,
    textInfo: AppColors.textInfo,
    textWarning: AppColors.textWarning,
    textError: AppColors.textError,
    textSuccess: AppColors.textSuccess,
    skeletonBase: AppColors.skeletonBase,
    skeletonHigh: AppColors.skeletonHigh,
    opBackground: AppColors.opBackground,
    devBackground: AppColors.devBackground,
    colorAccent: AppColors.colorAccent,
    toolsAccent: AppColors.toolsAccent,
    historyAccent: AppColors.historyAccent,
    clearBackground: AppColors.clearBackground,
  );

  // ─── Light variant ───
  static const light = AppColorScheme(
    surface: AppColors.lightSurface,
    surfacebase: AppColors.lightSurface,
    surfaceRaised: AppColors.lightGray150,
    gray150: AppColors.lightGray150,
    gray200: AppColors.lightGray200,
    gray300: AppColors.lightGray300,
    gray400: AppColors.lightGray400,
    gray500: AppColors.lightGray500,
    primary: AppColors.lightPrimary,
    primaryDark: AppColors.lightPrimaryDark,
    secondary: AppColors.lightSecondary,
    error: AppColors.lightError,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    textNeutral: AppColors.lightTextNeutral,
    textTertiary: AppColors.lightTextTertiary,
    textInverse: AppColors.lightTextInverse,
    textInfo: AppColors.lightTextInfo,
    textWarning: AppColors.lightTextWarning,
    textError: AppColors.lightTextError,
    textSuccess: AppColors.lightTextSuccess,
    skeletonBase: AppColors.lightSkeletonBase,
    skeletonHigh: AppColors.lightSkeletonHigh,
    opBackground: AppColors.lightOpBackground,
    devBackground: AppColors.lightDevBackground,
    colorAccent: AppColors.lightColorAccent,
    toolsAccent: AppColors.lightToolsAccent,
    historyAccent: AppColors.lightHistoryAccent,
    clearBackground: AppColors.lightClearBackground,
  );

  @override
  AppColorScheme copyWith({
    Color? surface,
    Color? surfacebase,
    Color? surfaceRaised,
    Color? gray150,
    Color? gray200,
    Color? gray300,
    Color? gray400,
    Color? gray500,
    Color? primary,
    Color? primaryDark,
    Color? secondary,
    Color? error,
    Color? textPrimary,
    Color? textSecondary,
    Color? textNeutral,
    Color? textTertiary,
    Color? textInverse,
    Color? textInfo,
    Color? textWarning,
    Color? textError,
    Color? textSuccess,
    Color? skeletonBase,
    Color? skeletonHigh,
    Color? opBackground,
    Color? devBackground,
    Color? colorAccent,
    Color? toolsAccent,
    Color? historyAccent,
    Color? clearBackground,
  }) {
    return AppColorScheme(
      surface: surface ?? this.surface,
      surfacebase: surfacebase ?? this.surfacebase,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      gray150: gray150 ?? this.gray150,
      gray200: gray200 ?? this.gray200,
      gray300: gray300 ?? this.gray300,
      gray400: gray400 ?? this.gray400,
      gray500: gray500 ?? this.gray500,
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textNeutral: textNeutral ?? this.textNeutral,
      textTertiary: textTertiary ?? this.textTertiary,
      textInverse: textInverse ?? this.textInverse,
      textInfo: textInfo ?? this.textInfo,
      textWarning: textWarning ?? this.textWarning,
      textError: textError ?? this.textError,
      textSuccess: textSuccess ?? this.textSuccess,
      skeletonBase: skeletonBase ?? this.skeletonBase,
      skeletonHigh: skeletonHigh ?? this.skeletonHigh,
      opBackground: opBackground ?? this.opBackground,
      devBackground: devBackground ?? this.devBackground,
      colorAccent: colorAccent ?? this.colorAccent,
      toolsAccent: toolsAccent ?? this.toolsAccent,
      historyAccent: historyAccent ?? this.historyAccent,
      clearBackground: clearBackground ?? this.clearBackground,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      surface: Color.lerp(surface, other.surface, t)!,
      surfacebase: Color.lerp(surfacebase, other.surfacebase, t)!,
      surfaceRaised: Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
      gray150: Color.lerp(gray150, other.gray150, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      gray400: Color.lerp(gray400, other.gray400, t)!,
      gray500: Color.lerp(gray500, other.gray500, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textNeutral: Color.lerp(textNeutral, other.textNeutral, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      textInfo: Color.lerp(textInfo, other.textInfo, t)!,
      textWarning: Color.lerp(textWarning, other.textWarning, t)!,
      textError: Color.lerp(textError, other.textError, t)!,
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t)!,
      skeletonBase: Color.lerp(skeletonBase, other.skeletonBase, t)!,
      skeletonHigh: Color.lerp(skeletonHigh, other.skeletonHigh, t)!,
      opBackground: Color.lerp(opBackground, other.opBackground, t)!,
      devBackground: Color.lerp(devBackground, other.devBackground, t)!,
      colorAccent: Color.lerp(colorAccent, other.colorAccent, t)!,
      toolsAccent: Color.lerp(toolsAccent, other.toolsAccent, t)!,
      historyAccent: Color.lerp(historyAccent, other.historyAccent, t)!,
      clearBackground: Color.lerp(clearBackground, other.clearBackground, t)!,
    );
  }
}
