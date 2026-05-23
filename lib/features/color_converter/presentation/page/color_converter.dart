import 'package:devcalc/core/widgets/shared_appbar.dart';
import 'package:devcalc/features/color_converter/presentation/widgets/color_area.dart';
import 'package:devcalc/features/color_converter/presentation/widgets/color_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorConverterPage extends StatelessWidget {
  const ColorConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const SharedAppbar(title: 'Color Converter')),
      body: SingleChildScrollView(
        child: Column(
          children: [const ColorArea(), 10.verticalSpace, const ColorTypes()],
        ),
      ),
    );
  }
}
