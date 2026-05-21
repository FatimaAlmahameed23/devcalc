part of 'color_converter_cubit.dart';

@freezed
sealed class ColorConverterState with _$ColorConverterState {
  const factory ColorConverterState({
    @Default(255) int r,
    @Default(107) int g,
    @Default(107) int b,
  }) = _Initial;
}
