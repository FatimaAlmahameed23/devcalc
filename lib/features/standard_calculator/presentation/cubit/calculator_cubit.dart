import 'package:devcalc/core/services/clipboard_service.dart';
import 'package:devcalc/core/utils/number_formatter.dart';
import 'package:devcalc/features/standard_calculator/domain/models/calculation_result.dart';
import 'package:devcalc/features/standard_calculator/domain/models/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/expression_evaluator.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  final ExpressionEvaluator _evaluator;
  final ClipboardService _clipboard;
  CalculatorCubit(this._evaluator, this._clipboard)
    : super(const CalculatorState());

  static const _operators = {'+', '−', '×', '÷'};

  void appendDigit(String digit) {
    if (state.status != CalculatorStatus.editing) {
      emit(CalculatorState(expression: digit));
      return;
    }
    emit(state.copyWith(expression: state.expression + digit));
  }

  void appendOperator(String op) {
    if (state.status == CalculatorStatus.showingResult) {
      final formattedResult = state.result != null
          ? formatNumber(state.result!)
          : '';

      emit(CalculatorState(expression: formattedResult + op));
      return;
    }
    if (state.status == CalculatorStatus.error) {
      emit(const CalculatorState());
      return;
    }
    if (state.expression.isEmpty) {
      return;
    }
    final lastChar = state.expression.substring(state.expression.length - 1);
    if (_operators.contains(lastChar)) {
      final newExpression =
          state.expression.substring(0, state.expression.length - 1) + op;
      emit(state.copyWith(expression: newExpression));
      return;
    }
    final newExpression = state.expression + op;
    emit(state.copyWith(expression: newExpression));
  }

  void appendDecimal() {
    if (state.status == CalculatorStatus.editing) {
      final lastOpIndex = state.expression.lastIndexOf(RegExp(r'[+−×÷]'));
      final currentNumber = lastOpIndex == -1
          ? state.expression
          : state.expression.substring(lastOpIndex + 1);

      if (currentNumber.contains('.')) {
        return;
      }
      final suffix = currentNumber.isEmpty ? '0.' : '.';
      final newExpression = state.expression + suffix;
      emit(state.copyWith(expression: newExpression));
    } else {
      emit(const CalculatorState(expression: '0.'));
    }
  }

  void appendPercent() {
    if (state.status == CalculatorStatus.error) {
      emit(const CalculatorState());
      return;
    }

    if (state.status == CalculatorStatus.showingResult) {
      final percentValue = state.result! / 100;
      emit(CalculatorState(expression: formatNumber(percentValue)));
      return;
    }

    if (state.expression.isEmpty) return;

    final lastOpIndex = state.expression.lastIndexOf(RegExp(r'[+−×÷]'));
    final currentNumber = lastOpIndex == -1
        ? state.expression
        : state.expression.substring(lastOpIndex + 1);

    final N = double.tryParse(currentNumber);
    if (N == null) return;

    final precedingOp = lastOpIndex == -1
        ? null
        : state.expression[lastOpIndex];

    final secondLastOpIndex = lastOpIndex <= 0
        ? -1
        : state.expression
              .substring(0, lastOpIndex)
              .lastIndexOf(RegExp(r'[+−×÷]'));
    final prevOperand = lastOpIndex <= 0
        ? ''
        : state.expression.substring(secondLastOpIndex + 1, lastOpIndex);

    final percentValue = switch (precedingOp) {
      '+' || '−' => (double.tryParse(prevOperand) ?? 0) * N / 100,
      _ => N / 100,
    };

    final newExpression =
        state.expression.substring(0, lastOpIndex + 1) +
        formatNumber(percentValue);

    emit(state.copyWith(expression: newExpression));
  }

  void backspace() {
    if (state.status != CalculatorStatus.editing || state.expression.isEmpty) {
      return;
    }
    final newExpression = state.expression.substring(
      0,
      state.expression.length - 1,
    );
    emit(state.copyWith(expression: newExpression));
  }

  void evaluate() {
    final currentExpression = state.expression;
    if (currentExpression.isEmpty) {
      return;
    }
    final result = _evaluator.evaluate(currentExpression);
    switch (result) {
      case CalculationSuccess(:final result):
        emit(
          state.copyWith(
            status: CalculatorStatus.showingResult,
            result: result,
          ),
        );
      case CalculationFailure(:final errorMessage):
        emit(
          state.copyWith(
            status: CalculatorStatus.error,
            errorMessage: errorMessage,
          ),
        );
    }
  }

  Future<bool> copyResult() async {
    if (state.status != CalculatorStatus.showingResult ||
        state.result == null) {
      return false;
    }
    final format = formatNumber(state.result!);
    await _clipboard.copy(format);
    return true;
  }

  void clear() {
    emit(const CalculatorState());
  }
}
