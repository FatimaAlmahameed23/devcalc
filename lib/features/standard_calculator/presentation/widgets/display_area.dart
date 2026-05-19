import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/core/utils/number_formatter.dart';
import 'package:devcalc/features/standard_calculator/presentation/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayArea extends StatelessWidget {
  const DisplayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.h, 18.h, 14.h, 18.h),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [PreviewText(), MainText(), CopyResultButton()],
            ),
          ),
        ),
      ],
    );
  }
}

class CopyResultButton extends StatelessWidget {
  const CopyResultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 22.h,
        child: ElevatedButton(
          onPressed: () async {
            final cubit = context.read<CalculatorCubit>();
            final copied = await cubit.copyResult();

            if (!context.mounted || !copied) return;

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Copied to clipboard'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: context.colors.surfaceRaised,
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
              side: BorderSide(color: context.colors.gray300, width: 0.5.h),
            ),
          ),
          child: Text(
            'copy result',
            style: AppTextStyles.successS11W400(context),
          ),
        ),
      ),
    );
  }
}

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) => SizedBox(
        height: 65.h,
        child: Text(
          switch (state.status) {
            CalculatorStatus.editing =>
              state.expression.isEmpty ? '0' : state.expression,
            CalculatorStatus.showingResult =>
              state.result == null ? '' : formatNumber(state.result!),
            CalculatorStatus.error => state.errorMessage ?? 'Error',
          },
          style: AppTextStyles.primaryS56W300(context).copyWith(
            fontSize: state.status == CalculatorStatus.error ? 30 : null,
          ),
        ),
      ),
    );
  }
}

class PreviewText extends StatelessWidget {
  const PreviewText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) => SizedBox(
        height: 18.h,
        child: Text(switch (state.status) {
          CalculatorStatus.editing => '',
          CalculatorStatus.showingResult => state.expression,
          CalculatorStatus.error => state.expression,
        }, style: AppTextStyles.subtleS13W400(context)),
      ),
    );
  }
}
