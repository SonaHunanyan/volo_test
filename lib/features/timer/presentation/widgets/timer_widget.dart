import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/extensions/duration_extension.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    required this.duration,
    required this.isPlaying,
    required this.onPlayPause,
    super.key,
  });
  final Duration duration;
  final bool isPlaying;
  final VoidCallback onPlayPause;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 48.h,
      padding: EdgeInsets.all(8.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(64.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            duration.toHM(),
          ),
          GestureDetector(
            onTap: onPlayPause,
            child: SizedBox(
              width: 24.r,
              height: 24.r,
              child:
                  SvgPicture.asset(isPlaying ? AppIcons.pause : AppIcons.play),
            ),
          )
        ],
      ),
    );
  }
}
