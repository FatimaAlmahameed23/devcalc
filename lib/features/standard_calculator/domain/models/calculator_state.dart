import 'package:equatable/equatable.dart';

enum CalculatorStatus { editing, showingResult, error }

class CalculatorState extends Equatable {
  final String expression;
  final String result;
  final CalculatorStatus status;
  final String? errorMessage;

  const CalculatorState({
    this.expression = '',
    this.result = '',
    this.status = CalculatorStatus.editing,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [expression, result, status, errorMessage];

  CalculatorState copyWith({
    String? expression,
    String? result,
    CalculatorStatus? status,
    String? errorMessage,
  }) {
    return CalculatorState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
