import 'package:devcalc/app/di/service_locator.dart';
import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/core/services/clipboard_service.dart';
import 'package:devcalc/features/programmer_calculator/domain/enums/number_base.dart';
import 'package:devcalc/features/programmer_calculator/presentation/cubit/programmer_calculator_cubit.dart';
import 'package:devcalc/features/programmer_calculator/presentation/utils/programmer_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerCalculatorDisplayArea extends StatelessWidget {
  const ProgrammerCalculatorDisplayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.gray150,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.colors.gray300),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.h),
        child:
            BlocBuilder<ProgrammerCalculatorCubit, ProgrammerCalculatorState>(
              builder: (context, state) {
                final value =
                    int.tryParse(state.input, radix: state.activeBase.radix) ??
                    0;

                return Column(
                  children: [
                    DisplayCard(
                      label: 'BIN',
                      value: ProgrammerFormatter.formatBin(value),
                      isActive: state.activeBase == NumberBase.bin,
                    ),
                    const CardDivider(),
                    DisplayCard(
                      label: 'OCT',
                      value: ProgrammerFormatter.formatOct(value),
                      isActive: state.activeBase == NumberBase.oct,
                    ),
                    const CardDivider(),
                    DisplayCard(
                      label: 'DEC',
                      value: ProgrammerFormatter.formatDec(value),
                      isActive: state.activeBase == NumberBase.dec,
                    ),
                    const CardDivider(),
                    DisplayCard(
                      label: 'HEX',
                      value: ProgrammerFormatter.formatHex(value),
                      isActive: state.activeBase == NumberBase.hex,
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}

class DisplayCard extends StatelessWidget {
  final String label;
  final String? value;
  final bool isActive;
  const DisplayCard({
    super.key,
    required this.label,
    this.value = '',
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isActive) Container(width: 2, color: context.colors.primary),
              10.horizontalSpace,
              Text(label, style: AppTextStyles.secondaryS11W400(context)),
              15.horizontalSpace,
              Text(
                isActive
                    ? value != null
                          ? '${value!} |' // TODO: animate cursor
                          : ''
                    : value ?? '',
                style: AppTextStyles.primaryS14W400(
                  context,
                ).copyWith(color: isActive ? context.colors.primary : null),
              ),
            ],
          ),
          _CopyChip(valueToCopy: value ?? ''),
        ],
      ),
    );
  }
}

class CardDivider extends StatelessWidget {
  const CardDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: context.colors.gray200, thickness: 1);
  }
}

class _CopyChip extends StatelessWidget {
  final String valueToCopy;
  const _CopyChip({required this.valueToCopy});

  Future<void> _handleCopy(BuildContext context) async {
    await getIt<ClipboardService>().copy(valueToCopy);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleCopy(context),
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: context.colors.gray200,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text('copy', style: AppTextStyles.secondaryS9W400(context)),
      ),
    );
  }
}
