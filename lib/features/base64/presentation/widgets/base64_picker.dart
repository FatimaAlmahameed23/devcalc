import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/features/base64/domain/enum/operation_type.dart';
import 'package:devcalc/features/base64/presentation/cubit/base64_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Base64Picker extends StatelessWidget {
  const Base64Picker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Base64Cubit, Base64State>(
      builder: (context, state) {
        final cubit = context.read<Base64Cubit>();
        return Row(
          children: [
            SegmentContainer(
              label: 'Encode',
              icon: Icons.arrow_downward,
              isActive: state.operationType == OperationType.encode,
              onTap: () {
                cubit.changeOperationType(OperationType.encode);
              },
            ),
            10.horizontalSpace,
            SegmentContainer(
              label: 'Decode',
              icon: Icons.arrow_upward,
              isActive: state.operationType == OperationType.decode,
              onTap: () {
                cubit.changeOperationType(OperationType.decode);
              },
            ),
          ],
        );
      },
    );
  }
}

class SegmentContainer extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  const SegmentContainer({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.h),
        decoration: BoxDecoration(
          color: isActive ? context.colors.primary : context.colors.gray150,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isActive ? context.colors.primary : context.colors.gray300,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.secondaryS12W600(
                context,
              ).copyWith(color: isActive ? context.colors.textInverse : null),
            ),
            3.horizontalSpace,
            Icon(
              icon,
              size: 12.sp,
              color: isActive
                  ? context.colors.textInverse
                  : context.colors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
