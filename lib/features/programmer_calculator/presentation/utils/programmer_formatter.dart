import '../../domain/enums/number_base.dart';

class ProgrammerFormatter {
  const ProgrammerFormatter._();

  /// Example: `255` → `'0000 0000 1111 1111'`.
  static String formatBin(int value) {
    final raw = value.toRadixString(2).padLeft(16, '0');
    return '${raw.substring(0, 4)} ${raw.substring(4, 8)} '
        '${raw.substring(8, 12)} ${raw.substring(12, 16)}';
  }

  /// Example: `255` → `'000377'`.
  static String formatOct(int value) {
    return value.toRadixString(8).padLeft(6, '0');
  }

  /// Example: `255` → `'255'`.
  static String formatDec(int value) {
    return value.toString();
  }

  /// Example: `255` → `'0x00FF'`.
  static String formatHex(int value) {
    final raw = value.toRadixString(16).toUpperCase().padLeft(4, '0');
    return '0x$raw';
  }

  /// padding, prefix, and grouping for that base.
  static String formatFor(int value, NumberBase base) => switch (base) {
    NumberBase.bin => formatBin(value),
    NumberBase.oct => formatOct(value),
    NumberBase.dec => formatDec(value),
    NumberBase.hex => formatHex(value),
  };
}