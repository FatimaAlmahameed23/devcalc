import 'package:devcalc/app/di/service_locator.dart';
import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/core/services/clipboard_service.dart';
import 'package:devcalc/features/base64/domain/enum/operation_type.dart';
import 'package:devcalc/features/base64/presentation/cubit/base64_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Base64ConvertArea extends StatefulWidget {
  const Base64ConvertArea({super.key});

  @override
  State<Base64ConvertArea> createState() => _Base64ConvertAreaState();
}

class _Base64ConvertAreaState extends State<Base64ConvertArea> {
  late final TextEditingController _controller;

  @override
  initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<Base64Cubit>().state.inputText,
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<Base64Cubit, Base64State>(
      listenWhen: (prev, curr) =>
          prev.inputText != curr.inputText || prev.error != curr.error,
      listener: (context, state) {
        if (_controller.text != state.inputText) {
          _controller.text = state.inputText;
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      child: BlocBuilder<Base64Cubit, Base64State>(
        builder: (context, state) {
          return state.operationType == OperationType.encode
              ? Column(
                  children: [
                    TextContainer(
                      label: 'Encoded Text',
                      text: state.inputText,
                      isInput: true,
                      isEditable: true,
                      operationType: OperationType.encode,
                      controller: _controller,
                    ),
                    6.verticalSpace,
                    Icon(
                      Icons.arrow_downward,
                      color: context.colors.gray300,
                      size: 18.h,
                    ),
                    6.verticalSpace,
                    TextContainer(
                      label: 'Decoded Text',
                      text: state.convertedText,
                      isInput: false,
                      operationType: OperationType.decode,
                    ),
                  ],
                )
              : Column(
                  children: [
                    TextContainer(
                      label: 'Decoded Text',
                      text: state.inputText,
                      isInput: true,
                      isEditable: true,
                      operationType: OperationType.decode,
                      controller: _controller,
                    ),
                    6.verticalSpace,
                    Icon(
                      Icons.arrow_downward,
                      color: context.colors.gray300,
                      size: 18.h,
                    ),
                    6.verticalSpace,
                    TextContainer(
                      label: 'Encoded Text',
                      text: state.convertedText,
                      isInput: false,
                      operationType: OperationType.encode,
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String label;
  final String text;
  final bool isInput;
  final bool? isEditable;
  final OperationType operationType;
  final TextEditingController? controller;
  const TextContainer({
    super.key,
    required this.label,
    required this.text,
    required this.isInput,
    this.isEditable = false,
    required this.operationType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.gray150,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.colors.gray300),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles.secondaryS11W400(context)),
            10.verticalSpace,
            isEditable == true
                ? TextField(
                    controller: controller,
                    maxLines: null,
                    style: AppTextStyles.primaryS13W400(context),
                    onChanged: (value) {
                      context.read<Base64Cubit>().changeInputText(value);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                  )
                : Text(
                    text,
                    style: AppTextStyles.primaryS13W400(
                      context,
                    ).copyWith(color: isInput ? null : context.colors.primary),
                  ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${text.length} chars',
                  style: AppTextStyles.neutralS11W400(context),
                ),
                if (isInput) ...[
                  InkWell(
                    onTap: () {
                      context.read<Base64Cubit>().clear();
                    },
                    child: Icon(
                      Icons.close,
                      color: context.colors.textSecondary,
                      size: 16.sp,
                    ),
                  ),
                ],
                if (!isInput) ...[
                  InkWell(
                    onTap: () async {
                      await getIt<ClipboardService>().copy(text);
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Copied to clipboard'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      height: 22.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'copy',
                        style: AppTextStyles.inverseS12W700(context),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
