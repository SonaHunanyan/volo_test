import 'package:flutter/material.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/ui/widgets/widgets.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    required this.controller,
    required this.hint,
    this.onChanged,
    super.key,
  });
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      height: null,
      child: TextField(
        onChanged: onChanged,
        maxLength: 300,
        maxLines: null,
        cursorColor: context.themeData.colorScheme.onSurface,
        keyboardType: TextInputType.number,
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          color: context.themeData.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: context.themeData.textTheme.bodyLarge?.copyWith(
            color: context.themeData.colorScheme.onSurface,
          ),
          counterText: '',
        ),
        controller: controller,
      ),
    );
  }
}
