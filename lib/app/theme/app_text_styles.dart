import 'package:devcalc/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get _monoBase => GoogleFonts.jetBrainsMono();

  static TextStyle get secondartS48W300 => _monoBase.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w300,
    color: AppColors.darkTextPrimary,
  );
}
