import 'package:flutter/material.dart';
import 'package:volo_test/core/theme/app_colors.dart';
import 'package:volo_test/core/theme/app_fonts.dart';
import 'package:volo_test/core/theme/app_text_styles.dart';
import 'package:volo_test/core/theme/theme_colors.dart';

final base = ThemeData(
  brightness: Brightness.light,
  fontFamily: FontFamily.inter,
);
final lightTheme = base.copyWith(
  scaffoldBackgroundColor: AppColors.downriver,
  extensions: const <ThemeExtension<dynamic>>[
    ThemeColors.light(),
  ],
  colorScheme: ColorScheme.light(
    onSurface: AppColors.white,
    secondaryContainer: AppColors.white.withOpacity(0.16),
    onSecondaryContainer: AppColors.white,
    primaryContainer: AppColors.white,
    error: AppColors.red,
    surfaceBright: AppColors.white.withOpacity(0.08),
  ),
  textTheme: base.primaryTextTheme.copyWith(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    displaySmall: AppTextStyles.displaySmall,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
  ),
);
