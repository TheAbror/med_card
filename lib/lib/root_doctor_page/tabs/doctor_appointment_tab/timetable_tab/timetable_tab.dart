import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/lib/root_page/pages/localization/bloc/localization_bloc.dart';
import '../doctor_appointment_tab.dart';
import 'bloc/timetable_bloc.dart';
import 'widgets/calendar_dates.dart';

class TimetableTab extends StatefulWidget {
  const TimetableTab({
    super.key,
  });

  @override
  State<TimetableTab> createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {
  @override
  Widget build(BuildContext context) {
    final localState = context.read<LocalizationBloc>().state;

    DateTime now = DateTime.now();
    var formattedDate = DateFormat('d MMMM', localState.languageCode).format(now);
    var dayofWeek = DateFormat('EEEE', localState.languageCode).format(now);
    var year = DateFormat('yyyy', localState.languageCode).format(now);

    return BlocProvider(
      create: (context) => TimetableBloc(),
      child: BlocBuilder<TimetableBloc, TimetableState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  elevation: 0.1,
                  child: Container(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        Text(
                          'Расписание',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          // '${context.localizations.today} -
                          '$formattedDate, $dayofWeek - $year',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0XFF9DA4B2),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        const CalendarDates(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Expanded(
                  flex: state.blocProgress == BlocProgress.IS_LOADING ? 0 : 1,
                  child: DoctorAppointmentTab(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
    // if (state.blocProgress == BlocProgress.FAILED) {
          //   return const SomethingWentWrong();
          // }


// if (state.selectedTimetableSlots.isEmpty && state.blocProgress == BlocProgress.LOADED)
                //   Expanded(
                //     flex: 10,
                //     child: Center(
                //       child: Text(
                //         'context.localizations.noResultsText',
                //         style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // if (state.blocProgress == BlocProgress.IS_LOADING)
                //   Expanded(
                //     flex: 10,
                //     child: Center(child: AttendanceLoaderSmall()),
                //   ),