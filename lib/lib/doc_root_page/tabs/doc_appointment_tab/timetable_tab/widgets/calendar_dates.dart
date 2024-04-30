import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';

import '../bloc/timetable_bloc.dart';

class CalendarDates extends StatelessWidget {
  const CalendarDates({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> getWidgetsList(TimetableState state) {
      final widgetsList = <Widget>[];

      final shortWeekdays = <String>[
        // context.localizations.mon,
        // context.localizations.tue,
        // context.localizations.wed,
        // context.localizations.thu,
        // context.localizations.fri,
        // context.localizations.sat,
        'mon',
        'tue',
        'wed',
        'thu',
        'fri',
        'sat',
      ];

      for (var i = 0; i < shortWeekdays.length; i++) {
        String day = shortWeekdays[i];
        bool selected = i == state.selectedWeekDay;

        widgetsList.add(
          GestureDetector(
            onTap: () {
              BlocProvider.of<TimetableBloc>(context).updateSelectedWeekDay(i);
            },
            child: CalendarListTile(weekDay: day, isToday: selected),
          ),
        );
      }

      return widgetsList;
    }

    return BlocBuilder<TimetableBloc, TimetableState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getWidgetsList(state),
        );
      },
    );
  }
}

class CalendarListTile extends StatelessWidget {
  final String weekDay;
  final int? date;
  final bool isToday;

  const CalendarListTile({
    super.key,
    this.isToday = true,
    this.date,
    required this.weekDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: 52.67.w,
      padding: EdgeInsets.symmetric(horizontal: 7.3.w, vertical: 6.h),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: isToday ? AppColors.textMain : AppColors.inputField,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          Text(
            weekDay,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: isToday ? AppColors.float : Theme.of(context).colorScheme.tertiary,
            ),
          ),
          SizedBox(width: 4.w),
          Assets.icons.homeTabIcons.indicator.svg(
            colorFilter: ColorFilter.mode(
              isToday ? Colors.red : AppColors.inputField,
              BlendMode.srcIn,
            ),
            fit: BoxFit.fill,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
