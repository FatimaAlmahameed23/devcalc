part of 'base64_cubit.dart';

@freezed
sealed class Base64State with _$Base64State {
  const factory Base64State({
    @Default(OperationType.encode) OperationType operationType,
    @Default('') String inputText,
    @Default('') String convertedText,
    String? error,
  }) = _Base64State;
}
