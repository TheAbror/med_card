import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareCetificateCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonTitle;
  final VoidCallback onTap;

  const ShareCetificateCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.outline, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Assets.icons.homeTabIcons.cup.image(height: 48.w, width: 48.w),
          Text(
            title,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            subTitle,
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 44.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textMain,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                border: Border.all(color: AppColors.primary, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.homeTabIcons.share.svg(),
                  SizedBox(width: 8.w),
                  Text(
                    buttonTitle,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 15.sp,
                      color: AppColors.float,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Assets.icons.homeTabIcons.certificate.image(
            height: 125.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
