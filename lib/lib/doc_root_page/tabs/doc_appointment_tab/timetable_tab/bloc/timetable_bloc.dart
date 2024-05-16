import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';

import '../model/timetable_model.dart';

part 'timetable_state.dart';

class TimetableBloc extends Cubit<TimetableState> {
  TimetableBloc() : super(TimetableState.initial());

  // void getTimetableInitial() async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.timetableService.getTimetableInitial();

  //     if (response.isSuccessful) {
  //       final timetable = re1sponse.body;

  //       if (timetable != null) {
  //         emit(state.copyWith(
  //           timetable: timetable,
  //           subTitleText: timetable.slots?.filteredBy?.value,
  //           blocProgress: BlocProgress.LOADED,
  //         ));

  //         DateTime now = DateTime.now();
  //         int currentWeekDay = now.weekday - 1;

  //         updateSelectedWeekDay(currentWeekDay);
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }

  void changeTitleText(String text) {
    emit(state.copyWith(titleText: text));
    emit(state.copyWith(subTitleText: ''));
  }

  void changeSubtitleFilterText(String text) {
    emit(state.copyWith(subTitleText: text));
  }

  void updateSelectedWeekDay(int weekday) {
    final timetable = state.timetable;
    var selectedTimetableSlots = <WeekDay>[];

    if (timetable != null) {
      if (weekday == 0) {
        selectedTimetableSlots = timetable.monday ??
            [
              WeekDay(
                patientInfo: PatientInfo(
                  id: 4,
                  fullName: 'Shohruh Umarov',
                  phone_number: '998997997996',
                  meeting_time: '15:30',
                  topic: 'Vaccination appointment',
                  comments: 'Bring vaccination record',
                ),
              ),
            ];
      } else if (weekday == 1) {
        selectedTimetableSlots = timetable.tuesday ??
            [
              WeekDay(
                patientInfo: PatientInfo(
                  id: 4,
                  fullName: 'Shohruh Umarov',
                  phone_number: '998997997996',
                  meeting_time: '15:30',
                  topic: 'Vaccination appointment',
                  comments: 'Bring vaccination record',
                ),
              ),
            ];
      } else if (weekday == 2) {
        selectedTimetableSlots = timetable.wednesday ??
            [
              WeekDay(
                patientInfo: PatientInfo(
                  id: 4,
                  fullName: 'Shohruh Umarov',
                  phone_number: '998997997996',
                  meeting_time: '15:30',
                  topic: 'Vaccination appointment',
                  comments: 'Bring vaccination record',
                ),
              ),
            ];
      } else if (weekday == 3) {
        selectedTimetableSlots = timetable.thursday ?? [];
      } else if (weekday == 4) {
        selectedTimetableSlots = timetable.friday ??
            [
              WeekDay(
                patientInfo: PatientInfo(
                  id: 4,
                  fullName: 'Shohruh Umarov',
                  phone_number: '998997997996',
                  meeting_time: '15:30',
                  topic: 'Vaccination appointment',
                  comments: 'Bring vaccination record',
                ),
              ),
            ];
      } else if (weekday == 5) {
        selectedTimetableSlots = timetable.saturday ?? [];
      }
    }
    emit(
      state.copyWith(
        selectedWeekDay: weekday,
        selectedTimetableSlots: selectedTimetableSlots,
        blocProgress: BlocProgress.LOADED,
      ),
    );
  }
}
