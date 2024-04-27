import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

import '../../localization/bloc/localization_bloc.dart';

class LangItem extends StatelessWidget {
  final String text;
  final bool isInquiry;

  const LangItem(
    this.text, {
    super.key,
    this.isInquiry = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        final isSelected = state.languageCode == text.toLowerCase();

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.read<LocalizationBloc>().changeLocalization(text.toLowerCase());
          },
          child: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? AppColors.primary : Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        );
      },
    );
  }
}
