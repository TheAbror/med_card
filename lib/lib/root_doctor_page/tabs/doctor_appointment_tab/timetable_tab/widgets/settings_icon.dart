import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 36.w,
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 9.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8.r),
      ),
      // child: Assets.icons.homePageIcons.settingsFilterTimetable.svg(),
    );
  }
}
