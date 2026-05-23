import 'package:devcalc/core/widgets/shared_appbar.dart';
import 'package:devcalc/features/base64/presentation/widgets/base64_convert_area.dart';
import 'package:devcalc/features/base64/presentation/widgets/base64_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Base64 extends StatelessWidget {
  const Base64({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SharedAppbar(title: 'Base64 Converter')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(14.h, 8.h, 14.h, 4.h),
          child: Column(
            children: [
              const Base64Picker(),
              12.verticalSpace,
              const Base64ConvertArea(),
            ],
          ),
        ),
      ),
    );
  }
}
