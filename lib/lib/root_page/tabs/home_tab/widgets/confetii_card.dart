import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfettiCard extends StatelessWidget {
  final String title;
  final String subTitle;

  const ConfettiCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.outline, width: 1.w),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Assets.icons.homeTabIcons.confettiBottom.image(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Center(
              child: Column(
                children: [
                  Assets.icons.homeTabIcons.confettiMain.image(),
                  SizedBox(height: 10.h),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(
                    width: 224.w,
                    child: Text(
                      subTitle,
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: -15,
            child: Assets.icons.homeTabIcons.confettiBottom.image(),
          ),
        ],
      ),
    );
  }
}
