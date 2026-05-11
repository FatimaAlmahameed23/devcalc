import 'package:devcalc/core/services/flutter_clipboard_service.dart';
import 'package:devcalc/features/standard_calculator/domain/services/expression_evaluator.dart';
import 'package:devcalc/features/standard_calculator/presentation/cubit/calculator_cubit.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/display_area.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/standard_calculator_buttons.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/standard_calculator_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandardCalculatorPage extends StatelessWidget {
  const StandardCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorCubit>(
      create: (context) => CalculatorCubit(ExpressionEvaluator(), FlutterClipboardService()),
      child: Scaffold(
        appBar: AppBar(title: const StandaredCalculatorAppbar()),
        body: const Column(
          children: [DisplayArea(), StandardCalculatorButtons()],
        ),
      ),
    );
  }
}
