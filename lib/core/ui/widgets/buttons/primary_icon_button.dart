import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    required this.icon,
    this.onTap,
    super.key,
  });

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.r,
      width: 48.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SizedBox(
        height: 20.h,
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
