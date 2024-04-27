import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:med_card/core/router/app_routes.dart';

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
                Icon(
                  Icons.add_card_rounded,
                  color: AppColors.float,
                  size: 26.sp,
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
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: AppColors.float,
                  size: 26.sp,
                ),
                Spacer(),
                Icon(
                  Icons.qr_code,
                  color: AppColors.float,
                  size: 26.sp,
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.notifications_active,
                  color: AppColors.float,
                  size: 26.sp,
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
                      Text(
                        'Все специальности',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      DoctorTypeItem(
                        icon: Icons.text_increase_outlined,
                        title: 'Терапевт участковый',
                      ),
                      DoctorTypeItem(
                        icon: Icons.hearing,
                        title: 'Oторино-лоринголог',
                      ),
                      DoctorTypeItem(
                        icon: Icons.check_circle_outlined,
                        title: 'Эндокринолог',
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      DoctorTypeItem(
                        icon: Icons.check_circle_outlined,
                        title: 'Эндокринолог',
                      ),
                      DoctorTypeItem(
                        icon: Icons.text_increase_outlined,
                        title: 'Терапевт участковый',
                      ),
                      DoctorTypeItem(
                        icon: Icons.hearing,
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
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.float,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.house,
                              color: AppColors.primary,
                              size: 26.sp,
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
                                      color: AppColors.iconSecondary),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: AppColors.primary,
                              size: 24.sp,
                            )
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
                            Icon(
                              Icons.edit_document,
                              color: AppColors.primary,
                              size: 26.sp,
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
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: AppColors.primary,
                              size: 24.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                  )
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
  final IconData icon;

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
        // border: Border.all(color: AppColors.outline, width: 0.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 26.sp,
          ),
          SizedBox(height: 5.h),
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