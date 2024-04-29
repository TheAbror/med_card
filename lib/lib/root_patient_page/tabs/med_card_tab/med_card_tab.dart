import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';

class MedCardTab extends StatelessWidget {
  const MedCardTab({super.key});
  //TODO  shows charts of illnesses

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: 120.h,
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                color: AppColors.iconSecondary,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: 1.w,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'adsfdss',
                style: TextStyle(fontSize: 24.sp),
                textAlign: TextAlign.center,
              ),
            ),
            Text('Name: Abror Shamuradov'),
            Text('Age: 22'),
            Text('Gender: Male'),
            Text('Phone Number: +998914309090'),
            Text('Blood type : B3+'),
            SizedBox(height: 20.h),
            MedCardItem(
              icon: Assets.icons.figmaIcons.record2.path,
              text: 'Illness history',
            ),
            MedCardItem(
              icon: Assets.icons.figmaIcons.barcode.path,
              text: 'Allergy history',
            ),
          ],
        ),
      ),
    );
  }
}

class MedCardItem extends StatelessWidget {
  final String text;
  final String icon;

  const MedCardItem({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 17.h,
      ),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          Spacer(),
          Assets.icons.figmaIcons.arrowRight.svg(
            colorFilter: ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
