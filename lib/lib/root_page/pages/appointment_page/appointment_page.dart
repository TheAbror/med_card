import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

import 'bloc/appointment_bloc.dart';

class AppointmentPage extends StatelessWidget {
  AppointmentPage({super.key});

  final List<DateTime> days = List.generate(
    7,
    (index) => DateTime.now().add(Duration(days: index)),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc(),
      child: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 7,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.1,
                title: Text('Недельный Таб-бар'),
                bottom: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.float, width: 3.0),
                    ),
                  ),
                  tabs: days.map((day) {
                    String dayLabel = '';
                    if (day.day == DateTime.now().day) {
                      dayLabel = 'Сегодня';
                    } else {
                      dayLabel = day.weekday == 1
                          ? 'Пн'
                          : day.weekday == 2
                              ? 'Вт'
                              : day.weekday == 3
                                  ? 'Ср'
                                  : day.weekday == 4
                                      ? 'Чт'
                                      : day.weekday == 5
                                          ? 'Пт'
                                          : day.weekday == 6
                                              ? 'Сб'
                                              : 'Вс';
                    }
                    return Tab(
                      text: '$dayLabel ${day.day}',
                    );
                  }).toList(),
                ),
              ),
              body: TabBarView(
                children: days.map((day) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    child: ListView.builder(
                      itemCount: 4, // Number of rows
                      itemBuilder: (context, rowIndex) {
                        final startHour = 8 + (rowIndex * 3);
                        final endHour = startHour + 1;
                        return Row(
                          children: List.generate(
                            3,
                            (colIndex) {
                              final startTime = TimeOfDay(hour: startHour + colIndex, minute: 0);
                              final endTime = TimeOfDay(hour: endHour + colIndex, minute: 0);
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Update selected indices for the tapped item
                                    context
                                        .read<AppointmentBloc>()
                                        .selectedIndex(rowIndex, colIndex);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: state.rowIndex == rowIndex &&
                                              state.colIndex == colIndex
                                          ? Colors.blue
                                          : Colors.white, // Change color based on selected indices
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Text(
                                      '${startTime.format(context)}-${endTime.format(context)}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: state.rowIndex == rowIndex &&
                                                state.colIndex == colIndex
                                            ? Colors.white
                                            : Colors
                                                .blue, // Change text color based on selected indices
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
