import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/features/standard_calculator/presentation/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StandardCalculatorButtons extends StatelessWidget {
  const StandardCalculatorButtons({super.key});
  @override
  Widget build(BuildContext context) {
    final calculatorCubit = context.read<CalculatorCubit>();
    final colors = context.colors;

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(12.h, 0.h, 12.h, 12.h),
      child: Column(
        children: [
          Row(
            children: [
              _CalcButton(
                label: 'AC',
                bgColor: colors.clearBackground,
                fgColor: colors.error,
                onPressed: () {
                  calculatorCubit.clear();
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: Icons.backspace_outlined,
                bgColor: colors.gray200,
                fgColor: colors.textSecondary,
                onPressed: () {
                  calculatorCubit.backspace();
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '%',
                bgColor: colors.gray200,
                fgColor: colors.textSecondary,
                onPressed: () {
                  calculatorCubit.appendPercent();
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '÷',
                bgColor: colors.opBackground,
                fgColor: colors.secondary,
                onPressed: () {
                  calculatorCubit.appendOperator('÷');
                },
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '7',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('7');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '8',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('8');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '9',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('9');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '×',
                bgColor: colors.opBackground,
                fgColor: colors.secondary,
                onPressed: () {
                  calculatorCubit.appendOperator('×');
                },
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '4',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('4');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '5',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('5');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '6',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('6');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '−',
                bgColor: colors.opBackground,
                fgColor: colors.secondary,
                onPressed: () {
                  calculatorCubit.appendOperator('−');
                },
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '1',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('1');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '2',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('2');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '3',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDigit('3');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '+',
                bgColor: colors.opBackground,
                fgColor: colors.secondary,
                onPressed: () {
                  calculatorCubit.appendOperator('+');
                },
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '0',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                flex: 2,
                onPressed: () {
                  calculatorCubit.appendDigit('0');
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '.',
                bgColor: colors.gray200,
                fgColor: colors.textPrimary,
                onPressed: () {
                  calculatorCubit.appendDecimal();
                },
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '=',
                bgColor: colors.opBackground,
                fgColor: colors.secondary,
                onPressed: () {
                  calculatorCubit.evaluate();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalcButton extends StatelessWidget {
  final dynamic label;
  final Color bgColor;
  final Color fgColor;
  final int? flex;
  final VoidCallback? onPressed;

  const _CalcButton({
    required this.label,
    required this.bgColor,
    required this.fgColor,
    this.flex = 1,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: SizedBox(
        height: 85.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: label is IconData
              ? Icon(label)
              : Text(
                  label,
                  style: AppTextStyles.primaryS18W400(
                    context,
                  ).copyWith(color: fgColor),
                ),
        ),
      ),
    );
  }
}
