import 'package:devcalc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle get _monoBase =>
      const TextStyle(fontFamily: 'JetBrainsMono');

  // ---------------------- Secondary Text Styles ------------------ //
  static TextStyle subtleS13W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );

  static TextStyle mutedS11W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );

  // ---------------------- Neutral Text Styles ------------------ //
  static TextStyle neutralS11W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: context.colors.textNeutral,
  );

  // ---------------------- Primary Text Styles ------------------ //
  static TextStyle primaryS48W300(BuildContext context) => _monoBase.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w300,
    color: context.colors.textPrimary,
  );

  static TextStyle primaryS18W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: context.colors.textPrimary,
  );
  static TextStyle primaryS11W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: context.colors.textPrimary,
  );

  // ---------------------- Success Text Styles ------------------ //

  static TextStyle successS11W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: context.colors.textSuccess,
  );
}
