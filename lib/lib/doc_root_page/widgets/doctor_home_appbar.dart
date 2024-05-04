import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

PreferredSize home_app_bar(BuildContext context, VoidCallback onTap) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.h),
    child: Container(
      margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 45.h),
      padding: EdgeInsets.only(bottom: 6.h, top: 6.h, left: 12.w, right: 20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: AvatarBox(shortName: 'AS'),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Abror Shamuradov',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'fds',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w200,
                    color: const Color(0XFF8C8C8C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class AvatarBox extends StatelessWidget {
  final String shortName;

  const AvatarBox({
    super.key,
    required this.shortName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.h,
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.inputField,
        borderRadius: BorderRadius.all(Radius.circular(4 * 3.r)),
      ),
      child: Text(
        shortName,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.textMain,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
