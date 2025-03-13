import 'package:flutter/material.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar(
    BuildContext context, {
    required String titleText,
    super.actions,
    super.key,
  }) : super(
          centerTitle: false,
          backgroundColor: context.themeData.scaffoldBackgroundColor,
          title: Text(
            titleText,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.themeData.colorScheme.onSurface,
            ),
          ),
        );
}
