import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

class SignInUsernameField extends StatelessWidget {
  final TextEditingController _usernameController;

  const SignInUsernameField({
    super.key,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Please enter value';
        }
        return null;
      },
      controller: _usernameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none, // Remove border color
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Theme.of(context).colorScheme.surfaceTint,
        hintText: 'ID',
      ),
    );
  }
}
