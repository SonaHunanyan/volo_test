import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/features/timer/domain/model/order_type.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_event.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_state.dart';

class SortByWidget extends StatelessWidget {
  const SortByWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(24.r);
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) => Container(
        height: 168.h,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: context.themeData.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.sortBy,
                style: context.themeData.textTheme.bodySmall?.copyWith(
                  color: context.themeData.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            ...OrderType.values.map(
              (e) => _ItemWidget(
                isSelected: state.orderType == e,
                orderType: e,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.isSelected,
    required this.orderType,
  });
  final bool isSelected;
  final OrderType orderType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          return;
        }
        context.read<TimerBloc>().add(TimerEvent$Sort(orderType: orderType));
        Navigator.of(context).pop();
      },
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: context.themeData.colorScheme.outline,
          ),
        )),
        child: Row(
          children: [
            SizedBox(
              width: 24.r,
              height: 24.r,
              child: Visibility(
                visible: isSelected,
                child: SvgPicture.asset(AppIcons.check),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              orderType.title,
              style: context.themeData.textTheme.labelLarge?.copyWith(
                color: context.themeData.colorScheme.onSurface,
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension on OrderType {
  String get title => switch (this) {
        OrderType.recent => AppStrings.recent,
        OrderType.oldest => AppStrings.oldest,
      };
}
