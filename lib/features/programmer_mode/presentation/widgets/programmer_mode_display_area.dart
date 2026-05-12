import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammerModeDisplayArea extends StatelessWidget {
  const ProgrammerModeDisplayArea({super.key});

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
        child: const Column(
          children: [
            DisplayCard(label: 'BIN', value: '0000 1010 0011 1100'),
            CardDivider(),
            DisplayCard(label: 'OCT', value: '005074'),
            CardDivider(),
            DisplayCard(label: 'DEC', value: '2620'),
            CardDivider(),
            DisplayCard(label: 'HEX', value: '0x0A3C'),
          ],
        ),
      ),
    );
  }
}

class DisplayCard extends StatelessWidget {
  final String label;
  final String? value;
  const DisplayCard({super.key, required this.label, this.value = ''});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(label, style: AppTextStyles.secondaryS11W400(context)),
              15.horizontalSpace,
              Text(value ?? '', style: AppTextStyles.primaryS14W400(context)),
            ],
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(4.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: context.colors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'copy',
                style: AppTextStyles.secondaryS9W400(context),
              ),
            ),
          ),
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
