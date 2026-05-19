import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/features/programmer_calculator/presentation/cubit/programmer_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerCalculatorButtons extends StatelessWidget {
  const ProgrammerCalculatorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgrammerCalculatorCubit>();
    return Column(
      children: [
        Row(
          children: [
            _ProgrammerCalculatorButton(
              label: 'A',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {
                cubit.appendDigit('A');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: 'B',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {
                cubit.appendDigit('B');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: 'C',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {
                cubit.appendDigit('C');
              },
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerCalculatorButton(
              label: 'D',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {
                cubit.appendDigit('D');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: 'E',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {
                cubit.appendDigit('E');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: 'F',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {
                cubit.appendDigit('F');
              },
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerCalculatorButton(
              label: '7',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('7');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '8',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('8');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '9',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('9');
              },
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerCalculatorButton(
              label: '4',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('4');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '5',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('5');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '6',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('6');
              },
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerCalculatorButton(
              label: '1',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('1');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '2',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('2');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '3',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('3');
              },
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerCalculatorButton(
              icon: Icons.backspace_outlined,
              bgColor: context.colors.gray150,
              fgColor: context.colors.textSecondary,
              onPressed: () {
                cubit.backspace();
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: '0',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {
                cubit.appendDigit('0');
              },
            ),
            6.horizontalSpace,
            _ProgrammerCalculatorButton(
              label: 'AC',
              bgColor: context.colors.clearBackground,
              fgColor: context.colors.textError,
              onPressed: () {
                cubit.clear();
              },
            ),
          ],
        ),
        6.verticalSpace,
      ],
    );
  }
}

class _ProgrammerCalculatorButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onPressed;

  const _ProgrammerCalculatorButton({
    this.label,
    this.icon,
    required this.bgColor,
    required this.fgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 60.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          onPressed: onPressed,
          child: icon != null
              ? Icon(icon)
              : Text(
                  label!,
                  style: AppTextStyles.primaryS15W600(
                    context,
                  ).copyWith(color: fgColor),
                ),
        ),
      ),
    );
  }
}
