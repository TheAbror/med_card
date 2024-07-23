import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/lib/doc_root_page/tabs/doc_appointment_tab/accept_patient.dart';
import 'package:med_card/lib/root_patient_page/pages/localization/bloc/localization_bloc.dart';
import 'bloc/timetable_bloc.dart';
import 'widgets/calendar_dates.dart';

class TimetableTab extends StatefulWidget {
  const TimetableTab({super.key});

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _appBar(context, formattedDate, dayofWeek, year),
              SizedBox(height: 14.h),
              if (state.selectedTimetableSlots.isEmpty)
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 250.h),
                  child: Text(
                    'No patients',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                )),
              Expanded(
                flex: state.blocProgress == BlocProgress.IS_LOADING ? 0 : 1,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: state.selectedTimetableSlots.length,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    var result = state.selectedTimetableSlots[index];

                    return Card(
                      elevation: 1,
                      color: AppColors.float,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      child: ExpansionTile(
                        shape: Border(),
                        maintainState: true,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.bottomLeft,
                        childrenPadding: EdgeInsets.only(bottom: 10.h, left: 12.w),
                        title: Text(
                          result.patientInfo?.fullName ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ID :${result.patientInfo!.id}'),
                                  Text('Время :${result.patientInfo!.meeting_time}'),
                                  Text('Номер:${result.patientInfo!.phone_number}'),
                                  Text('Проблемная тема: ${result.patientInfo!.topic}'),
                                  Text('Комментарий: ${result.patientInfo!.comments}'),
                                  SizedBox(height: 8.h),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.patientdetailsPage,
                                    arguments: PatientInfoWhenAccept(
                                      id: result.patientInfo!.id.toString(),
                                      name: result.patientInfo!.fullName,
                                      topic: result.patientInfo!.topic,
                                      comment: result.patientInfo!.comments,
                                      time: result.patientInfo!.meeting_time,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.float,
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                    border: Border.all(color: AppColors.primary),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Детали',
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 14.sp,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.acceptPatientPage,
                                    arguments: PatientInfoWhenAccept(
                                      id: result.patientInfo!.id.toString(),
                                      name: result.patientInfo!.fullName,
                                      topic: result.patientInfo!.topic,
                                      comment: result.patientInfo!.comments,
                                      time: result.patientInfo!.meeting_time,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 30.h,
                                  margin: EdgeInsets.only(right: 12.w),
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Принять',
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 14.sp,
                                        color: AppColors.float,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Material _appBar(BuildContext context, String formattedDate, String dayofWeek, String year) {
    return Material(
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
    );
  }
}
