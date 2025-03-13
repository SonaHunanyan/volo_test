import 'package:flutter/material.dart';
import 'package:volo_test/core/theme/app_colors.dart';
import 'package:volo_test/core/theme/theme_colors.dart';

final base = ThemeData.light();
final lightTheme = base.copyWith(
  scaffoldBackgroundColor: AppColors.downriver,
  extensions: const <ThemeExtension<dynamic>>[
    ThemeColors.light(),
  ],
  colorScheme: const ColorScheme.light(),
);
