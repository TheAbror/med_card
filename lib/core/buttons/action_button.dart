import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.text,
    this.isFilled = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isFilled ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              letterSpacing: 0.5,
              fontSize: 15.sp,
              color: !isFilled ? AppColors.textMain : AppColors.float,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
