import 'package:flutter/material.dart';

enum CalculatorButtonType { number, operator, function, equal, clear }

class CalculatorButton {
  final String? label;
  final Icon? icon;
  final CalculatorButtonType type;
  final int columnSpan;

  const CalculatorButton({
    this.label,
    this.icon,
    required this.type,
    this.columnSpan = 1,
  }) : assert(
         label != null || icon != null,
         'A button must have either a label or an icon',
       );
}
