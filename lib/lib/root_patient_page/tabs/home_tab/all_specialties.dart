import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/gen/assets.gen.dart';

class AllSpecialties extends StatelessWidget {
  const AllSpecialties({super.key});

  @override
  Widget build(BuildContext context) {
    final route = Assets.icons.specialties;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Assets.icons.figmaIcons.arrowLeft.svg(
            colorFilter: ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
            width: 24.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SpecialtiesItem(
              text: 'earNoseAndThroat',
              icon: route.earNoseAndThroat.path,
            ),
            SpecialtiesItem(
              text: 'cardiology',
              icon: route.cardiology.path,
            ),
            SpecialtiesItem(
              text: 'dermatology',
              icon: route.dermatology.path,
            ),
            SpecialtiesItem(
              text: 'emergencyCare',
              icon: route.emergencyCare.path,
            ),
            SpecialtiesItem(
              text: 'familyMedicine',
              icon: route.familyMedicine.path,
            ),
            SpecialtiesItem(
              text: 'gastroenterology',
              icon: route.gastroenterology.path,
            ),
            SpecialtiesItem(
              text: 'geriatricMedicine',
              icon: route.geriatricMedicine.path,
            ),
            SpecialtiesItem(
              text: 'immunology',
              icon: route.immunology.path,
            ),
            Spacer(),
            ActionButton(
              text: 'Записаться',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.appointmentPage,
                );
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class SpecialtiesItem extends StatelessWidget {
  final String icon;
  final String text;

  const SpecialtiesItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.appointmentPage,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.only(bottom: 8.h),
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
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Text(
                  'Explanation of what this doctor does',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    color: AppColors.iconSecondary,
                  ),
                ),
              ],
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
      ),
    );
  }
}
