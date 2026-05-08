import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayArea extends StatelessWidget {
  const DisplayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HistoryArea(),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.h, 12.h, 16.h, 14.h),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [ExpressionLine(), ResultLine(), CopyResultButton()],
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
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.surfaceRaised,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(color: context.colors.gray300, width: 0.5.h),
          ),
        ),
        child: Text(
          'copy result',
          style: AppTextStyles.successS11W400(context),
        ),
      ),
    );
  }
}

class ResultLine extends StatelessWidget {
  const ResultLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.w,
      child: Text('16', style: AppTextStyles.primaryS48W300(context)),
    );
  }
}

class ExpressionLine extends StatelessWidget {
  const ExpressionLine({super.key});

  final expression = '(5 + 3) * 2';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.w,
      child: Text(expression, style: AppTextStyles.subtleS13W400(context)),
    );
  }
}

class HistoryArea extends StatelessWidget {
  HistoryArea({super.key});

  final history = [2, 14, 1024];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.h, 4.h, 16.h, 0.h),
      child: Row(
        children: [
          for (var item in history) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: context.colors.surfaceRaised,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text('$item', style: AppTextStyles.mutedS11W400(context)),
            ),

            4.horizontalSpace,
          ],
        ],
      ),
    );
  }
}
