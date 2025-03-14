import 'package:flutter/material.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class PrimarySnackbar extends SnackBar {
  PrimarySnackbar(
    BuildContext context, {
    required String text,
    Color? color,
    super.key,
  }) : super(
          content: Text(
            text,
            style: context.themeData.textTheme.bodyMedium?.copyWith(
              color: context.themeData.colorScheme.onSurface,
            ),
          ),
          backgroundColor:
              color ?? context.themeData.colorScheme.secondaryContainer,
        );
}
