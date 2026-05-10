
sealed class CalculationResult {
  const CalculationResult();
}

class CalculationSuccess extends CalculationResult {
  final double result;

  const CalculationSuccess(this.result);
}

class CalculationFailure extends CalculationResult {
  final String errorMessage;

  const CalculationFailure(this.errorMessage);
}