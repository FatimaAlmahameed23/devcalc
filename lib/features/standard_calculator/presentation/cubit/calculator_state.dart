part of 'calculator_cubit.dart';

enum CalculatorStatus { editing, showingResult, error }

@freezed
sealed class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default('') String expression,
    double? result,
    @Default(CalculatorStatus.editing) CalculatorStatus status,
    String? errorMessage,
  }) = _CalculatorState;
}
