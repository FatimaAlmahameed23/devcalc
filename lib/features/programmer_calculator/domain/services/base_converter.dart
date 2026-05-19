import '../enums/number_base.dart';

class BaseConverter {
  static String format(int value, NumberBase base) {
    return value.toRadixString(base.radix).toUpperCase();
  }
}
