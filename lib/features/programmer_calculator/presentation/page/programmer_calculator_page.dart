import 'package:devcalc/core/widgets/shared_appbar.dart';
import 'package:devcalc/features/programmer_calculator/presentation/cubit/programmer_calculator_cubit.dart';
import 'package:devcalc/features/programmer_calculator/presentation/widgets/programmer_calculator_buttons.dart'
    show ProgrammerCalculatorButtons;
import 'package:devcalc/features/programmer_calculator/presentation/widgets/programmer_calculator_display_area.dart';
import 'package:devcalc/features/programmer_calculator/presentation/widgets/programmer_calculator_selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerCalculatorPage extends StatelessWidget {
  const ProgrammerCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgrammerCalculatorCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const SharedAppbar(title: 'Programmer Calculator'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(14.h, 8.h, 14.h, 4.h),
          child: Column(
            children: [
              const ProgrammerCalculatorSelectors(),
              10.verticalSpace,
              const ProgrammerCalculatorDisplayArea(),
              10.verticalSpace,
              const ProgrammerCalculatorButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
