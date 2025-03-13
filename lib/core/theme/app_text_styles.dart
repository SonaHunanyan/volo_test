import 'package:flutter/material.dart';

class AppTextStyles {
  /// Display
  static const displayLarge = _AppTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 57,
    height: 64,
    letterSpacing: 0,
  );
  static const displayMedium = _AppTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52,
    letterSpacing: 0,
  );
  static const displaySmall = _AppTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 36,
    height: 44,
    letterSpacing: 0,
  );

  /// Headline
  static const headlineLarge = _AppTextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 40,
    letterSpacing: 0,
  );
  static const headlineMedium = _AppTextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 36,
    letterSpacing: 0,
  );
  static const headlineSmall = _AppTextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 32,
    letterSpacing: 0,
  );

  /// Title
  static const titleLarge = _AppTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 28,
    letterSpacing: 0,
  );
  static const titleMedium = _AppTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24,
    letterSpacing: 0.15,
  );
  static const titleSmall = _AppTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20,
    letterSpacing: 0.1,
  );

  /// Label
  static const labelLarge = _AppTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20,
    letterSpacing: 0.1,
  );
  static const labelMedium = _AppTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16,
    letterSpacing: 0.5,
  );
  static const labelSmall = _AppTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    height: 16,
    letterSpacing: 0.5,
  );

  /// Body
  static const bodyLarge = _AppTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24,
    letterSpacing: 0.5,
  );
  static const bodyMedium = _AppTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20,
    letterSpacing: 0.25,
  );
  static const bodySmall = _AppTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16,
    letterSpacing: 0.4,
  );
}

class _AppTextStyle extends TextStyle {
  const _AppTextStyle({
    required double fontSize,
    double? height,
    double? letterSpacing,
    super.fontWeight,
  }) : super(
          fontSize: fontSize,
          height: height == null ? null : height / fontSize,
          letterSpacing:
              letterSpacing == null ? null : letterSpacing / fontSize,
        );
}
