part of 'programmer_calculator_cubit.dart';

@freezed
sealed class ProgrammerCalculatorState with _$ProgrammerCalculatorState {
  const factory ProgrammerCalculatorState({
    @Default('0') String input,
    @Default(NumberBase.bin) NumberBase activeBase,
  }) = _Initial;
}
