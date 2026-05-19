import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/features/programmer_calculator/domain/enums/number_base.dart';
import 'package:devcalc/features/programmer_calculator/presentation/cubit/programmer_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerCalculatorSelectors extends StatelessWidget {
  const ProgrammerCalculatorSelectors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgrammerCalculatorCubit, ProgrammerCalculatorState>(
      builder: (context, state) {
        return Row(
          children: [
            SelectorTab(
              base: NumberBase.bin,
              isActive: state.activeBase == NumberBase.bin,
            ),
            6.horizontalSpace,
            SelectorTab(
              base: NumberBase.oct,
              isActive: state.activeBase == NumberBase.oct,
            ),
            6.horizontalSpace,
            SelectorTab(
              base: NumberBase.dec,
              isActive: state.activeBase == NumberBase.dec,
            ),
            6.horizontalSpace,
            SelectorTab(
              base: NumberBase.hex,
              isActive: state.activeBase == NumberBase.hex,
            ),
          ],
        );
      },
    );
  }
}

class SelectorTab extends StatelessWidget {
  final NumberBase base;
  final bool isActive;
  const SelectorTab({super.key, required this.base, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          final cubit = context.read<ProgrammerCalculatorCubit>();
          cubit.switchBase(base);
        },
        child: Container(
          alignment: Alignment.center,
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? context.colors.primary : context.colors.gray150,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: context.colors.gray300),
          ),
          child: Text(
            base.label.toUpperCase(),
            style: AppTextStyles.secondaryS12W400(
              context,
            ).copyWith(color: isActive ? context.colors.textInverse : null),
          ),
        ),
      ),
    );
  }
}
