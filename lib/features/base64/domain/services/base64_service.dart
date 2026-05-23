import 'dart:convert';

import 'package:devcalc/features/base64/domain/models/base64_result.dart';

class Base64Service {
  Base64Result encode(String input) {
    if (input.isEmpty) {
      return const Base64Success('');
    }
    try {
      final bytes = utf8.encode(input);
      return Base64Success(base64Encode(bytes));
    } catch (_) {
      return const Base64Failure('Failed to encode');
    }
  }

  Base64Result decode(String input) {
    if (input.isEmpty) {
      return const Base64Success('');
    }
    try {
      final bytes = base64Decode(input);
      return Base64Success(utf8.decode(bytes));
    } catch (_) {
      return const Base64Failure('Failed to decode');
    }
  }
}
