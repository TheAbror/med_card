import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';

import 'sign_out_dialog.dart';

class MobileTab extends StatelessWidget {
  const MobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(8.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.float,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.outline, width: 1.w),
                ),
                child: Column(
                  children: [
                    CircleAvatar(radius: 50),
                    SizedBox(height: 10.h),
                    Text(
                      'John Doe',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
              MoreTabItem(),
              SizedBox(height: 10.h),
              Text(
                'General',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.float,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    MoreTabItemtext(text: 'Support'),
                    MoreTabItemtext(text: 'About app'),
                    MoreTabItemtext(text: 'Data usage'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
                      child: Row(
                        children: [
                          Text(
                            'Accessibility',
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
                    ),
                  ],
                ),
              ),
              // Spacer(),
              SizedBox(height: 30.h),
              ActionButton(
                text: 'Sign out',
                onPressed: () {
                  signOutDialog(context);
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreTabItem extends StatelessWidget {
  const MoreTabItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          MoreTabItemtext(text: 'Account'),
          MoreTabItemtext(text: 'Dashboard'),
          MoreTabItemtext(text: 'Notifications'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
            child: Row(
              children: [
                Text(
                  'Privacy and security',
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
          ),
        ],
      ),
    );
  }
}

class MoreTabItemtext extends StatelessWidget {
  final String text;

  const MoreTabItemtext({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
          child: Row(
            children: [
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
        ),
        Divider(),
      ],
    );
  }
}
