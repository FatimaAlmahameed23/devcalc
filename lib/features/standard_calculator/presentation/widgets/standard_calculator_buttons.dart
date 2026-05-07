import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extentions.dart';
import 'package:devcalc/features/standard_calculator/domain/entities/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StandardCalculatorButtons extends StatelessWidget {
  StandardCalculatorButtons({super.key});

  final List<List<String>> buttons = [
    ['AC', 'backSpace', '%', '÷'],
    ['7', '8', '9', '×'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['00', '0', '.', '='],
  ];

  // Last column = operator/equal, first row = function, rest = number
  CalculatorButtonType _typeOf(int row, int col) {
    if (col == 3) {
      return row == 4
          ? CalculatorButtonType.equal
          : CalculatorButtonType.operator;
    }
    if (row == 0) return CalculatorButtonType.function;
    return CalculatorButtonType.number;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final numberBg = colors.surfaceRaised;
    final functionBg = colors.surfaceRaised;
    final operatorBg = colors.surfaceRaised;
    final equalBg = colors.primary;

    final numberFg = colors.textPrimary;
    final functionFg = colors.textSecondary;
    final operatorFg = colors.secondary;
    final equalFg = colors.opBackground;

    return Padding(
      padding: EdgeInsets.all(10.h),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 8.h,
        mainAxisSpacing: 8.h,
        shrinkWrap: true,
        children: [
          for (var r = 0; r < buttons.length; r++)
            for (var c = 0; c < buttons[r].length; c++)
              _CalcButton(
                label: buttons[r][c],
                bgColor: switch (_typeOf(r, c)) {
                  CalculatorButtonType.number => numberBg,
                  CalculatorButtonType.function ||
                  CalculatorButtonType.clear => functionBg,
                  CalculatorButtonType.operator => operatorBg,
                  CalculatorButtonType.equal => equalBg,
                },
                fgColor: switch (_typeOf(r, c)) {
                  CalculatorButtonType.number => numberFg,
                  CalculatorButtonType.function ||
                  CalculatorButtonType.clear => functionFg,
                  CalculatorButtonType.operator => operatorFg,
                  CalculatorButtonType.equal => equalFg,
                },
              ),
        ],
      ),
    );
  }
}

class _CalcButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color fgColor;

  const _CalcButton({
    required this.label,
    required this.bgColor,
    required this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: AppTextStyles.primaryS18W400(context).copyWith(color: fgColor),
      ),
    );
  }
}
