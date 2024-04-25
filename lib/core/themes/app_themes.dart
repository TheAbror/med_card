import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    // fontFamily: FontFamily.lato,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.background,
      onBackground: AppColors.float,
      surface: AppColors.background,
      onSurface: AppColors.float,
      tertiary: AppColors.textMain,
      surfaceVariant: AppColors.float,
      onTertiary: const Color(0XFFF6F6F6),
      secondaryContainer: AppColors.iconSecondary,
      surfaceTint: AppColors.inputField,
      primaryContainer: AppColors.primary,
      onSurfaceVariant: Colors.grey.shade300,
      inverseSurface: AppColors.stroke,
      outline: AppColors.float,
      inversePrimary: AppColors.stroke,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 15.sp, color: AppColors.textMain),
      bodyMedium: const TextStyle(color: AppColors.textMain),
      displayLarge: TextStyle(
        fontSize: 11.sp,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: const TextStyle(color: AppColors.textMain),
      displaySmall: TextStyle(
        fontSize: 13.sp,
        // color: AppColors.textMain,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textMain,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        height: 1.2.h,
        color: const Color(0xFF333333),
      ),
    ),
  );
}
