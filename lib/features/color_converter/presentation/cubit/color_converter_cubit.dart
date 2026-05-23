import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devcalc/core/utils/color_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_converter_state.dart';
part 'color_converter_cubit.freezed.dart';

class ColorConverterCubit extends Cubit<ColorConverterState> {
  ColorConverterCubit() : super(const ColorConverterState());

  void updateR(int r) {
    emit(state.copyWith(r: r));
  }

  void updateG(int g) {
    emit(state.copyWith(g: g));
  }

  void updateB(int b) {
    emit(state.copyWith(b: b));
  }

  void updateH(double h) {
    ({double h, double s, double l}) hsl = ColorUtils.rgbToHsl(
      state.r,
      state.g,
      state.b,
    );

    ({int r, int g, int b}) rgb = ColorUtils.hslToRgb(h, hsl.s, hsl.l);

    emit(state.copyWith(r: rgb.r, g: rgb.g, b: rgb.b));
  }

  void updateS(double s) {
    ({double h, double s, double l}) hsl = ColorUtils.rgbToHsl(
      state.r,
      state.g,
      state.b,
    );

    ({int r, int g, int b}) rgb = ColorUtils.hslToRgb(hsl.h, s, hsl.l);

    emit(state.copyWith(r: rgb.r, g: rgb.g, b: rgb.b));
  }

  void updateL(double l) {
    ({double h, double s, double l}) hsl = ColorUtils.rgbToHsl(
      state.r,
      state.g,
      state.b,
    );

    ({int r, int g, int b}) rgb = ColorUtils.hslToRgb(hsl.h, hsl.s, l);

    emit(state.copyWith(r: rgb.r, g: rgb.g, b: rgb.b));
  }

  void updateHex(String hex) {
    ({int r, int g, int b}) rgb = ColorUtils.hexToRgb(hex);
    emit(state.copyWith(r: rgb.r, g: rgb.g, b: rgb.b));
  }
}
