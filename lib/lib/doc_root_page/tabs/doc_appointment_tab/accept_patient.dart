import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';

class AcceptPatientPage extends StatelessWidget {
  const AcceptPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.background,
        title: Text(
          'Notes',
          style: TextStyle(color: AppColors.primary),
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 8.w),
                Container(
                  height: 40.h,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.float,
                  ),
                  child: Text('Abror Shamuradov'),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Icon(Icons.abc),
                Text('Tap to start microphone'),
                Spacer(),
                Container(
                  height: 48.w,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: AppColors.float,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.mic,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.float,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
