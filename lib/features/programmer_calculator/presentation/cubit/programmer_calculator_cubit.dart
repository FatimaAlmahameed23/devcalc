import 'package:devcalc/features/programmer_calculator/domain/services/base_converter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/enums/number_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'programmer_calculator_state.dart';
part 'programmer_calculator_cubit.freezed.dart';

class ProgrammerCalculatorCubit extends Cubit<ProgrammerCalculatorState> {

  static const _max16BitValue = 0xFFFF;
  ProgrammerCalculatorCubit()
    : super(const ProgrammerCalculatorState());

  void switchBase(NumberBase newBase) {
    if (newBase == state.activeBase) return;
    final value = int.tryParse(state.input, radix: state.activeBase.radix) ?? 0;
    final newInput = BaseConverter.format(value, newBase);
    emit(state.copyWith(input: newInput, activeBase: newBase));
  }

  void appendDigit(String digit) {
    if (!state.activeBase.validDigits.contains(digit)) return;
    final newInput = state.input == '0' ? digit : state.input + digit;
    final parsed = int.tryParse(newInput, radix: state.activeBase.radix);
    if (parsed == null || parsed > _max16BitValue) return;
    emit(state.copyWith(input: newInput));
  }

  void backspace() {
    if (state.input.length <= 1) {
      emit(state.copyWith(input: '0'));
    } else {
      emit(
        state.copyWith(input: state.input.substring(0, state.input.length - 1)),
      );
    }
  }

  void clear() {
    emit(state.copyWith(input: '0'));
  }
}
