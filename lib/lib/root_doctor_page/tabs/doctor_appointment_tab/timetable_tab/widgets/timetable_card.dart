import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

class TimeTableCard extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String module;
  final String teacher;
  final String buildingNumber;

  const TimeTableCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.module,
    required this.teacher,
    required this.buildingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12.r),
      ),
      height: 81.h,
      child: Row(
        children: [
          Container(
            width: 63.w,
            decoration: BoxDecoration(
              color: const Color(0xFFE9EAEC),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  startTime,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textMain,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                // Assets.icons.homePageIcons.timetableLine.svg(),
                SizedBox(height: 4.h),
                Text(
                  endTime,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textMain,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    module,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      // Assets.icons.homePageIcons.teacher.svg(),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: SizedBox(
                          width: 180.w,
                          child: Text(
                            teacher,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Assets.icons.homePageIcons.building3.svg(),
                      SizedBox(width: 4.w),
                      SizedBox(
                        child: Text(
                          buildingNumber,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF9DA4B2),
                          ),
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
