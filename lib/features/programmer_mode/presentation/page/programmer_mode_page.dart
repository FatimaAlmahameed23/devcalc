import 'package:devcalc/core/widgets/shared_appbar.dart';
import 'package:devcalc/features/programmer_mode/presentation/widgets/programmer_mode_buttons.dart';
import 'package:devcalc/features/programmer_mode/presentation/widgets/programmer_mode_display_area.dart';
import 'package:devcalc/features/programmer_mode/presentation/widgets/programmer_mode_selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerModePage extends StatelessWidget {
  const ProgrammerModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SharedAppbar(title: 'programmer mode')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(14.h, 8.h, 14.h, 4.h),
        child: Column(
          children: [
            const ProgrammerModeSelectors(),
            10.verticalSpace,
            const ProgrammerModeDisplayArea(),
            10.verticalSpace,
            const ProgrammerModeButtons(),
          ],
        ),
      ),
    );
  }
}
