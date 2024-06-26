import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';

class MedCardTab extends StatelessWidget {
  const MedCardTab({super.key});
  //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 120.h,
                width: 120.h,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.background,
                    width: 1.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.person,
                  color: AppColors.float,
                  size: 54,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.float,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Имя: Abror Shamuradov',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Возраст: 22',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Пол: Male',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Номер телефона: +998914309090',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Группа крови : B3+',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // MedCardItem(
              //   icon: Assets.icons.figmaIcons.record2.path,
              //   text: 'История аллергии',
              // ),
              // MedCardItem(
              //   icon: Assets.icons.figmaIcons.barcode.path,
              //   text: 'История болезни',
              // ),
              // MedCardItem(
              //   icon: Assets.icons.figmaIcons.barcode.path,
              //   text: 'Встречи',
              // ),
              ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                backgroundColor: AppColors.float,
                collapsedBackgroundColor: AppColors.float,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                maintainState: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.bottomLeft,
                childrenPadding: EdgeInsets.only(bottom: 10.h, left: 12.w),
                title: Row(
                  children: [
                    Assets.icons.figmaIcons.record2.svg(
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Аллергии',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Орехи'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                backgroundColor: AppColors.float,
                collapsedBackgroundColor: AppColors.float,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                maintainState: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.bottomLeft,
                childrenPadding: EdgeInsets.only(bottom: 10.h, left: 12.w),
                title: Row(
                  children: [
                    Assets.icons.figmaIcons.barcode.svg(
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Встречи',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Дата : 23.01.2024'),
                      Text('Время : 10:00-10:30'),
                      Text('Специализация : Лор'),
                      Text('Доктор : Abror Shamuradov'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                backgroundColor: AppColors.float,
                collapsedBackgroundColor: AppColors.float,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                maintainState: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.bottomLeft,
                childrenPadding: EdgeInsets.only(bottom: 10.h, left: 12.w),
                title: Row(
                  children: [
                    Assets.icons.figmaIcons.barcode.svg(
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'История болезни',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Дата: 03.02.2024'),
                      Text('Грипп: Тайлол хот'),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
