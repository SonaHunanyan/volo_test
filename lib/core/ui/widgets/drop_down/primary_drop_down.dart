import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/ui/widgets/primary_container.dart';

class PrimaryDropdown extends StatefulWidget {
  const PrimaryDropdown({
    required this.items,
    required this.onSelect,
    required this.selected,
    super.key,
  });

  final List<String> items;
  final String selected;
  final ValueSetter<int> onSelect;

  @override
  State createState() => _PrimaryDropdownState();
}

class _PrimaryDropdownState extends State<PrimaryDropdown> {
  final GlobalKey buttonKey = GlobalKey();

  final _openValueNotifier = ValueNotifier(false);

  OverlayEntry? _overlayEntry;

  void _toggleMenu() {
    if (_openValueNotifier.value) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    final renderBox =
        buttonKey.currentContext!.findRenderObject()! as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position.dy + size.height + 4.h,
        left: 16.w,
        right: 16.w,
        child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: context.themeData.colorScheme.outline,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                for (var i = 0; i < widget.items.length; i++)
                  GestureDetector(
                    onTap: () {
                      widget.onSelect.call(i);
                      _removeOverlay();
                    },
                    child: Container(
                      height: 56.h,
                      width: MediaQuery.sizeOf(context).width,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        border: i == 0
                            ? null
                            : Border(
                                top: BorderSide(
                                  color: context
                                      .themeData.colorScheme.secondaryContainer,
                                ),
                              ),
                      ),
                      child: Text(
                        widget.items[i],
                        style: context.themeData.textTheme.bodyLarge?.copyWith(
                          color: context.themeData.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
              ],
            )),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    _openValueNotifier.value = true;
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _openValueNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: buttonKey,
      onTap: _toggleMenu,
      child: PrimaryContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selected,
              style: context.themeData.textTheme.bodyLarge?.copyWith(
                color: context.themeData.colorScheme.onSurface,
              ),
            ),
            SizedBox(
              width: 18.w,
              child: SvgPicture.asset(AppIcons.chevronDown),
            )
          ],
        ),
      ),
    );
  }
}
