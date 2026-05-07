import 'package:flutter/material.dart';

class FeatureAccents {
  final Color devBackground;
  final Color colorAccent;
  final Color toolsAccent;
  final Color historyAccent;

  const FeatureAccents({
    required this.devBackground,
    required this.colorAccent,
    required this.toolsAccent,
    required this.historyAccent,
  });

  static const dark = FeatureAccents(
    devBackground: Color(0xFF1A2035),
    colorAccent: Color(0xFFFF6B6B),
    toolsAccent: Color(0xFF1A3020),
    historyAccent: Color(0xFFBF5AF2),
  );

  static const light = FeatureAccents(
    devBackground: Color(0xFFDDF4FF),
    colorAccent: Color(0xFFCF222E),
    toolsAccent: Color(0xFFDAFBE1),
    historyAccent: Color(0xFF8250DF),
  );
}
