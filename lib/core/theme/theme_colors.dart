import 'package:flutter/material.dart';
import 'package:volo_test/core/theme/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.natural99,
  });

  const ThemeColors.light()
      : this(
          natural99: AppColors.persianBlue,
        );

  final Color natural99;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? natural99,
  }) {
    return ThemeColors(
      natural99: natural99 ?? this.natural99,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      natural99: Color.lerp(natural99, other.natural99, t)!,
    );
  }
}

extension ThemeColorsBuildContext on BuildContext {
  ThemeColors get themeColors => Theme.of(this).extension<ThemeColors>()!;
}
