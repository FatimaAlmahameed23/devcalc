import 'package:devcalc/app/di/service_locator.dart';
import 'package:devcalc/core/widgets/shared_appbar.dart';
import 'package:devcalc/features/standard_calculator/presentation/cubit/calculator_cubit.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/display_area.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/standard_calculator_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandardCalculatorPage extends StatelessWidget {
  const StandardCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorCubit>(
      create: (context) => CalculatorCubit(getIt(), getIt()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const SharedAppbar(title: 'calc')),
        body: const Column(
          children: [DisplayArea(), StandardCalculatorButtons()],
        ),
      ),
    );
  }
}
