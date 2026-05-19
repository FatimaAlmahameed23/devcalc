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
  static TextStyle secondaryS12W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );
  static TextStyle secondaryS11W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );
  static TextStyle mutedS10W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );
  static TextStyle secondaryS9W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 9,
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
  static TextStyle primaryS56W300(BuildContext context) => _monoBase.copyWith(
    fontSize: 56,
    fontWeight: FontWeight.w300,
    color: context.colors.textPrimary,
  );

  static TextStyle primaryS18W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: context.colors.textPrimary,
  );
   static TextStyle primaryS15W600(BuildContext context) => _monoBase.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: context.colors.textPrimary,
  );
  static TextStyle primaryS14W400(BuildContext context) => _monoBase.copyWith(
    fontSize: 14,
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
  // ---------------------- Inverse Text Styles ------------------ //

  static TextStyle inverseS12W700(BuildContext context) => _monoBase.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: context.colors.textInverse,
  );
}
