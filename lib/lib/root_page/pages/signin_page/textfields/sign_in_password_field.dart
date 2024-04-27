import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

import '../bloc/auth_bloc.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter value';
              }
              return null;
            },
            controller: _passwordController,
            obscureText: state.isPasswordHidden,
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
              hintText: 'Password',
              suffixIcon: InkWell(
                onTap: () {
                  context.read<AuthBloc>().isPasswordHidden();
                },
                child: state.isPasswordHidden
                    ? Icon(
                        Icons.visibility_outlined,
                        size: 20.sp,
                        color: AppColors.primary,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        size: 20.sp,
                        color: AppColors.primary,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
