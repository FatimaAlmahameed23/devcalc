import 'package:devcalc/features/base64/domain/models/base64_result.dart';
import 'package:devcalc/features/base64/domain/services/base64_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devcalc/features/base64/domain/enum/operation_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base64_state.dart';
part 'base64_cubit.freezed.dart';

class Base64Cubit extends Cubit<Base64State> {
  final Base64Service _base64Service = Base64Service();
  Base64Cubit() : super(const Base64State());

  void changeOperationType(OperationType operationType) {
    final newInputText = state.convertedText;
    final output = operationType == OperationType.encode
        ? _base64Service.encode(newInputText)
        : _base64Service.decode(newInputText);
    switch (output) {
      case Base64Success(:final result):
        emit(
          state.copyWith(
            operationType: operationType,
            inputText: newInputText,
            convertedText: result,
            error: null,
          ),
        );
      case Base64Failure(:final errorMessage):
        emit(
          state.copyWith(
            operationType: operationType,
            inputText: newInputText,
            convertedText: '',
            error: errorMessage,
          ),
        );
    }
  }

  void changeInputText(String inputText) {
    final output = state.operationType == OperationType.encode
        ? _base64Service.encode(inputText)
        : _base64Service.decode(inputText);
    switch (output) {
      case Base64Success(:final result):
        emit(
          state.copyWith(
            inputText: inputText,
            convertedText: result,
            error: null,
          ),
        );
      case Base64Failure(:final errorMessage):
        emit(
          state.copyWith(
            inputText: inputText,
            convertedText: '',
            error: errorMessage,
          ),
        );
    }
  }

  void clear() {
    emit(state.copyWith(inputText: '', convertedText: '', error: null));
  }
}
