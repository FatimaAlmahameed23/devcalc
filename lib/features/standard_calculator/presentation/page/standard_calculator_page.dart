import 'package:devcalc/core/widgets/shared_appbar.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/display_area.dart';
import 'package:devcalc/features/standard_calculator/presentation/widgets/standard_calculator_buttons.dart';
import 'package:flutter/material.dart';

class StandardCalculatorPage extends StatelessWidget {
  const StandardCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const SharedAppbar(title: 'calc')),
      body: const Column(
        children: [DisplayArea(), StandardCalculatorButtons()],
      ),
    );
  }
}
