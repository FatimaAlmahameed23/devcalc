import 'package:devcalc/app/di/service_locator.dart';
import 'package:devcalc/app/theme/app_text_styles.dart';
import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:devcalc/core/services/clipboard_service.dart';
import 'package:devcalc/core/utils/color_utils.dart';
import 'package:devcalc/features/color_converter/presentation/cubit/color_converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorTypes extends StatelessWidget {
  const ColorTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.w),
      child: BlocBuilder<ColorConverterCubit, ColorConverterState>(
        builder: (context, state) {
          final cubit = context.read<ColorConverterCubit>();
          final hsl = ColorUtils.rgbToHsl(state.r, state.g, state.b);

          return Column(
            children: [
              HexField(hex: ColorUtils.rgbToHex(state.r, state.g, state.b)),
              15.verticalSpace,
              ColorContainer(
                label: 'RGB',
                value: 'rgb(${state.r}, ${state.g}, ${state.b})',
                child: Column(
                  children: [
                    ColorSlider(
                      label: 'R',
                      colors: const [Color(0xFF0D1117), Color(0xFFFF0000)],
                      value: state.r.toDouble(),
                      onChanged: (v) {
                        cubit.updateR(v.toInt());
                      },
                    ),
                    15.verticalSpace,
                    ColorSlider(
                      label: 'G',
                      colors: const [Color(0xFF0D1117), Color(0xFF00FF00)],
                      value: state.g.toDouble(),
                      onChanged: (v) {
                        cubit.updateG(v.toInt());
                      },
                    ),
                    15.verticalSpace,
                    ColorSlider(
                      label: 'B',
                      colors: const [Color(0xFF0D1117), Color(0xFF0000FF)],
                      value: state.b.toDouble(),
                      onChanged: (v) {
                        cubit.updateB(v.toInt());
                      },
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              ColorContainer(
                label: 'HSL',
                value:
                    'hsl(${hsl.h.round()}, ${hsl.s.round()}%, ${hsl.l.round()}%)',
                child: Column(
                  children: [
                    ColorSlider(
                      label: 'H',
                      colors: const [
                        Color(0xFFFF0000),
                        Color(0xFFFFFF00),
                        Color(0xFF00FF00),
                        Color(0xFF00FFFF),
                        Color(0xFF0000FF),
                        Color(0xFFFF00FF),
                        Color(0xFFFF0000),
                      ],
                      value: hsl.h,
                      max: 360,
                      onChanged: (v) {
                        cubit.updateH(v);
                      },
                    ),
                    15.verticalSpace,
                    ColorSlider(
                      label: 'S',
                      colors: const [Color(0xFF888888), Color(0xFFFF6B6B)],
                      value: hsl.s,
                      max: 100,
                      onChanged: (v) {
                        cubit.updateS(v);
                      },
                    ),
                    15.verticalSpace,
                    ColorSlider(
                      label: 'L',
                      colors: const [
                        Color(0xFF000000),
                        Color(0xFFFF6B6B),
                        Color(0xFFFFFFFF),
                      ],
                      value: hsl.l,
                      min: 0,
                      max: 100,
                      onChanged: (v) {
                        cubit.updateL(v);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ColorContainer extends StatelessWidget {
  final String label;
  final Widget child;
  final String value;
  const ColorContainer({
    super.key,
    required this.label,
    required this.child,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.gray150,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: context.colors.gray300),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              textAlign: TextAlign.left,
              style: AppTextStyles.grayS8W400(context),
            ),
            10.verticalSpace,
            child,
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: AppTextStyles.grayS8W400(context)),
                InkWell(
                  onTap: () async {
                    await getIt<ClipboardService>().copy(value);
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Copied to clipboard'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.h,
                      vertical: 3.h,
                    ),
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: context.colors.gray300,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'copy',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.secondaryS9W400(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorSlider extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  const ColorSlider({
    super.key,
    required this.label,
    required this.colors,
    required this.value,
    this.min = 0,
    this.max = 255,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.secondaryS8W400(context)),
        10.horizontalSpace,
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 5,
              trackShape: GradientTrackShape(colors: colors),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              thumbColor: Colors.white,
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ),
        10.horizontalSpace,
        Text(
          value.toStringAsFixed(0),
          style: AppTextStyles.secondaryS8W400(context),
        ),
      ],
    );
  }
}

class GradientTrackShape extends SliderTrackShape {
  final List<Color> colors;

  const GradientTrackShape({required this.colors});

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 5;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(
      offset.dx,
      trackTop,
      parentBox.size.width,
      trackHeight,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final rect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final paint = Paint()
      ..shader = LinearGradient(colors: colors).createShader(rect);

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(3)),
      paint,
    );
  }
}

class HexField extends StatefulWidget {
  final String hex;
  const HexField({super.key, required this.hex});

  @override
  State<HexField> createState() => _HexFieldState();
}

class _HexFieldState extends State<HexField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.hex);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HexField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focusNode.hasFocus && oldWidget.hex != widget.hex) {
      _controller.text = widget.hex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rgb = ColorUtils.hexToRgb(widget.hex)!;
    return ColorContainer(
      label: 'HEX',
      value: widget.hex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('#', style: AppTextStyles.grayS8W400(context)),
          SizedBox(
            width: 260.h,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (value) {
                if (value.length != 7) return;
                final ok = context.read<ColorConverterCubit>().updateHex(value);
                if (!ok) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid hex color'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
              color: Color.fromRGBO(rgb.r, rgb.g, rgb.b, 1),
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: context.colors.gray300),
            ),
          ),
        ],
      ),
    );
  }
}
