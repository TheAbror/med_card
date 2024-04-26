import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  /// Constructor
  final TextEditingController controller;
  final dynamic validator;
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final bool? isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double width;
  final Color fillColor;
  final Function(String)? onChanged;

  const SearchInput({
    super.key,
    required this.controller,
    required this.width,
    required this.fillColor,
    this.validator,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.isEnabled,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 45.h,
          width: width,
          child: TextFormField(
            obscureText: isPassword,
            enabled: isEnabled,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.only(bottom: 2),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  // bottom: 16.h,
                  left: 16.w,
                ),
                child: Icon(Icons.search),
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14.sp),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.33.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.33.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.33.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.33.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
