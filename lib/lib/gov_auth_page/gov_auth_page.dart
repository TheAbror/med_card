import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/gen/assets.gen.dart';

class GovAuthPage extends StatelessWidget {
  const GovAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 40.h),
            Center(
              child: Assets.icons.figmaIcons.logo2.svg(
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
                height: 140,
              ),
            ),
            SizedBox(height: 50.h),
            TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: AppColors.textMain),
                hintText: 'Series and number',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textMain),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: AppColors.textMain),
                hintText: 'Date of Birth',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textMain),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            Spacer(),
            ActionButton(
                text: 'Check data',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.faceIdentificationPage);
                }),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
