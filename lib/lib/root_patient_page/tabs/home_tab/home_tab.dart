import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/gen/assets.gen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primary,
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 50.h),
            child: Row(
              children: [
                Assets.icons.figmaIcons.cardTick2.svg(
                  colorFilter: ColorFilter.mode(
                    AppColors.float,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  'Мой полис',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.float,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.govAuthPage);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Assets.icons.figmaIcons.arrowRight.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.float,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Material(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16.h),
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.float,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Assets.images.qRCode.svg(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Assets.icons.figmaIcons.barcode.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.float,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Assets.icons.figmaIcons.notification.svg(
                  colorFilter: ColorFilter.mode(
                    AppColors.float,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.primary,
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Запись',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.allSpecialties),
                        child: Text(
                          'Все специальности',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DoctorTypeItem(
                        icon: Assets.icons.specialties.immunology.path,
                        title: 'Терапевт участковый',
                      ),
                      DoctorTypeItem(
                        icon: Assets.icons.specialties.nephrology.path,
                        title: 'Oторино-лоринголог',
                      ),
                      DoctorTypeItem(
                        icon: Assets.icons.specialties.anesthesiology.path,
                        title: 'Эндокринолог',
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DoctorTypeItem(
                        icon: Assets.icons.specialties.cardiology.path,
                        title: 'Эндокринолог',
                      ),
                      DoctorTypeItem(
                        icon: Assets.icons.specialties.earNoseAndThroat.path,
                        title: 'Терапевт участковый',
                      ),
                      DoctorTypeItem(
                        icon: Assets.icons.specialties.anesthesiology.path,
                        title: 'Oторино-лоринголог',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ActionButton(
                    text: 'Записаться',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.appointmentPage,
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.float,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Assets.icons.figmaIcons.record2.svg(
                              colorFilter: ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Записи',
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                                ),
                                Text(
                                  'Ближайший 22 июня',
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
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.only(left: 35.w),
                          child: Divider(),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Assets.icons.figmaIcons.edit.svg(
                              colorFilter: ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Направления',
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
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
                      ],
                    ),
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

class DoctorTypeItem extends StatelessWidget {
  final String title;
  final String icon;

  const DoctorTypeItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 90.h,
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
