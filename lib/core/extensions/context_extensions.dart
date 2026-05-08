import 'package:flutter/material.dart';
import '../../app/theme/app_color_scheme.dart';

extension ThemeContext on BuildContext {
  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;
}
