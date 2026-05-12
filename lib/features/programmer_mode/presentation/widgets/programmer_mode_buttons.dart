import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerModeButtons extends StatelessWidget {
  const ProgrammerModeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _ProgrammerModeButton(
              label: 'A',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: 'B',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: 'C',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {},
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerModeButton(
              label: 'D',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: 'E',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: 'F',
              bgColor: context.colors.devBackground,
              fgColor: context.colors.textInfo,
              onPressed: () {},
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerModeButton(
              label: '7',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '8',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '9',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerModeButton(
              label: '4',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '5',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '6',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerModeButton(
              label: '1',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '2',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '3',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            _ProgrammerModeButton(
              icon: Icons.backspace_outlined,
              bgColor: context.colors.gray150,
              fgColor: context.colors.textSecondary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: '0',
              bgColor: context.colors.gray200,
              fgColor: context.colors.textPrimary,
              onPressed: () {},
            ),
            6.horizontalSpace,
            _ProgrammerModeButton(
              label: 'AC',
              bgColor: context.colors.clearBackground,
              fgColor: context.colors.textError,
              onPressed: () {},
            ),
          ],
        ),
        6.verticalSpace,
      ],
    );
  }
}

class _ProgrammerModeButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onPressed;

  const _ProgrammerModeButton({
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
              borderRadius: BorderRadius.circular(20),
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
