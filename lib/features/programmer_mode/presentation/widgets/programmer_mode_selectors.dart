import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerModeSelectors extends StatelessWidget {
  const ProgrammerModeSelectors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SelectorTab(label: 'BIN'),
        6.horizontalSpace,
        const SelectorTab(label: 'OCT'),
        6.horizontalSpace,
        const SelectorTab(label: 'DEC'),
        6.horizontalSpace,
        const SelectorTab(label: 'HEX'),
      ],
    );
  }
}

class SelectorTab extends StatelessWidget {
  final String label;
  const SelectorTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          height: 32,
          decoration: BoxDecoration(
            color: context.colors.gray150,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: context.colors.gray300),
          ),
          child: Text(label, style: AppTextStyles.secondaryS12W400(context)),
        ),
      ),
    );
  }
}
