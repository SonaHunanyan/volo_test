import 'package:flutter/material.dart';
import 'package:volo_test/core/theme/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.natural99,
    required this.gold,
  });

  const ThemeColors.light()
      : this(
          natural99: AppColors.persianBlue,
          gold: AppColors.sunglow,
        );

  final Color natural99;
  final Color gold;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? natural99,
    Color? gold,
  }) {
    return ThemeColors(
      natural99: natural99 ?? this.natural99,
      gold: gold ?? this.gold,
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
      gold: Color.lerp(gold, other.gold, t)!,
    );
  }
}

extension ThemeColorsBuildContext on BuildContext {
  ThemeColors get themeColors => Theme.of(this).extension<ThemeColors>()!;
}
