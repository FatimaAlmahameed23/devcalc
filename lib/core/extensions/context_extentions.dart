import 'package:flutter/material.dart';
import '../../app/theme/app_color_scheme.dart';

extension ThemeContext on BuildContext {
  /// Theme-aware semantic colors.
  /// Usage: `context.colors.textPrimary`
  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;
}
