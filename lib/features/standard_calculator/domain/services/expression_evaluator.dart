import 'package:devcalc/features/standard_calculator/domain/models/calculation_result.dart';
import 'package:math_expressions/math_expressions.dart';

class ExpressionEvaluator {
  CalculationResult evaluate(String expression) {
    final trimmedExpression = expression.trim();

    if (trimmedExpression.isEmpty) {
      return const CalculationFailure('Expression is empty');
    }

    final cleanExpression = trimmedExpression
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-');

    try {
      final parser = GrammarParser();
      final exp = parser.parse(cleanExpression);
      final evaluator = RealEvaluator(ContextModel());
      final value = evaluator.evaluate(exp);

      if (value.isInfinite) {
        return const CalculationFailure('Cannot divide by zero');
      }
      if (value.isNaN) {
        return const CalculationFailure('Invalid result');
      }
      return CalculationSuccess(value.toDouble());
    } catch (e) {
      return const CalculationFailure('Invalid expression');
    }
  }
}
