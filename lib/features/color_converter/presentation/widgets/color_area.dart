import 'package:devcalc/features/color_converter/presentation/cubit/color_converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorArea extends StatelessWidget {
  const ColorArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorConverterCubit, ColorConverterState>(
      builder: (context, state) {
        return Container(
          height: 180.h,
          width: double.infinity,
          color: Color.fromRGBO(state.r, state.g, state.b, 1),
        );
      },
    );
  }
}
