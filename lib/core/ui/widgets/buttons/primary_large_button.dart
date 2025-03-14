import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class PrimaryLargeButton extends StatelessWidget {
  const PrimaryLargeButton({
    required this.title,
    this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 48.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: context.themeData.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          title,
          style: context.themeData.textTheme.labelLarge
              ?.copyWith(color: context.themeData.colorScheme.onSurface),
        ),
      ),
    );
  }
}
