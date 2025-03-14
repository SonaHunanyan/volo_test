import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    required this.child,
    this.height = 56,
    super.key,
  });
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: context.themeData.colorScheme.secondaryContainer,
            width: 2.r,
          )),
      child: child,
    );
  }
}
