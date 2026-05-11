import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/app/theme/theme_notifier.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StandaredCalculatorAppbar extends StatelessWidget {
  const StandaredCalculatorAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14.0.w, 18.0.h, 6.0.w, 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('calc', style: AppTextStyles.subtleS13W400(context)),
          Row(
            children: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeNotifier,
                builder: (_, mode, __) => IconButton(
                  onPressed: toggleTheme,
                  icon: Icon(
                    mode == ThemeMode.dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    size: 16.h,
                    color: context.colors.textNeutral,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                ),
              ),
              8.horizontalSpace,
              Icon(
                Icons.history,
                size: 12.h,
                color: context.colors.textNeutral,
              ),
              4.horizontalSpace,
              Text('history', style: AppTextStyles.neutralS11W400(context)),
            ],
          ),
        ],
      ),
    );
  }
}
