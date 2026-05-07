import 'package:devcalc/features/standard_calculator/presentation/widgets/display_area.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/standard_calculator_buttons.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/standard_calculator_appbar.dart';
import 'package:flutter/material.dart';

class StandardCalculatorPage extends StatelessWidget {
  const StandardCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StandaredCalculatorAppbar()),
      body: Column(
        children: [const DisplayArea(), StandardCalculatorButtons()],
      ),
    );
  }
}
