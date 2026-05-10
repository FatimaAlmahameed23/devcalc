import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StandardCalculatorButtons extends StatelessWidget {
  const StandardCalculatorButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(12.h, 0.h, 12.h, 12.h),
      child: Column(
        children: [
          Row(
            children: [
              _CalcButton(
                label: 'AC',
                bgColor: context.colors.clearBackground,
                fgColor: context.colors.error,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: Icons.backspace_outlined,
                bgColor: context.colors.gray200,
                fgColor: context.colors.textSecondary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '%',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textSecondary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '÷',
                bgColor: context.colors.opBackground,
                fgColor: context.colors.secondary,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '7',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '8',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '9',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '×',
                bgColor: context.colors.opBackground,
                fgColor: context.colors.secondary,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '4',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '5',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '6',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '-',
                bgColor: context.colors.opBackground,
                fgColor: context.colors.secondary,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '1',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '2',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '3',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '+',
                bgColor: context.colors.opBackground,
                fgColor: context.colors.secondary,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _CalcButton(
                label: '0',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
                flex: 2,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '.',
                bgColor: context.colors.gray200,
                fgColor: context.colors.textPrimary,
              ),
              8.horizontalSpace,
              _CalcButton(
                label: '=',
                bgColor: context.colors.opBackground,
                fgColor: context.colors.secondary,
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

  const _CalcButton({
    required this.label,
    required this.bgColor,
    required this.fgColor,
    this.flex = 1,
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
          onPressed: () {},
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
