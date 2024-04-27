import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';

import '../model/udea_timetable.dart';

part 'timetable_state.dart';

class TimetableBloc extends Cubit<TimetableState> {
  TimetableBloc() : super(TimetableState.initial());

  // void getTimetableInitial() async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.timetableService.getTimetableInitial();

  //     if (response.isSuccessful) {
  //       final timetable = response.body;

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

  // void getGroupInfo({String? selectedGroupID}) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.timetableService.getGroupInfo(group_id: selectedGroupID);

  //     if (response.isSuccessful) {
  //       final timetable = response.body;

  //       if (timetable != null) {
  //         emit(state.copyWith(
  //           timetable: timetable,
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

  // void getTeacherInfo({String? selectedTeacherID}) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response =
  //         await ApiProvider.timetableService.getTeacherInfo(teacher_id: selectedTeacherID);

  //     if (response.isSuccessful) {
  //       final timetable = response.body;

  //       if (timetable != null) {
  //         emit(state.copyWith(
  //           timetable: timetable,
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

  // void getRoomInfo({String? selectedRoomValue}) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.timetableService.getRoomInfo(room_id: selectedRoomValue);

  //     if (response.isSuccessful) {
  //       final timetable = response.body;

  //       if (timetable != null) {
  //         emit(state.copyWith(
  //           timetable: timetable,
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

  // void selectGroup(String selectedValue) async {
  //   final groupsList = state.timetable?.generalInfo?.groups
  //       ?.where((element) => element.name.toLowerCase() == selectedValue.toLowerCase())
  //       .toList();

  //   String groupID = '';

  //   if (groupsList != null && groupsList.isNotEmpty) {
  //     groupID = groupsList.first.id;

  //     emit(
  //       state.copyWith(
  //         selectedTimetableSlots: [],
  //         mainSelectedValue: selectedValue,
  //       ),
  //     );

  //     getGroupInfo(selectedGroupID: groupID);
  //   }
  // }

  // void selectTeacher(String teacherName) {
  //   final teacherList = state.timetable?.generalInfo?.teachers
  //       ?.where((element) => element.name.toLowerCase() == teacherName.toLowerCase())
  //       .toList();

  //   String teacherID = '';

  //   if (teacherList != null && teacherList.isNotEmpty) {
  //     teacherID = teacherList.first.id;

  //     emit(
  //       state.copyWith(
  //         mainSelectedValue: teacherName,
  //         selectedTimetableSlots: [],
  //       ),
  //     );

  //     getTeacherInfo(selectedTeacherID: teacherID);
  //   }
  // }

  // void selectRoom(String roomName) {
  //   final roomList = state.timetable?.generalInfo?.rooms
  //       ?.where((element) => element.name.toLowerCase() == roomName.toLowerCase())
  //       .toList();

  //   String roomID = '';

  //   if (roomList != null && roomList.isNotEmpty) {
  //     roomID = roomList.first.id;

  //     emit(state.copyWith(
  //       mainSelectedValue: roomName,
  //       selectedTimetableSlots: [],
  //     ));

  //     getRoomInfo(selectedRoomValue: roomID);
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
    final timetable = state.timetable?.slots;
    var selectedTimetableSlots = <WeekDay>[];

    if (timetable != null) {
      if (weekday == 0) {
        selectedTimetableSlots = timetable.monday ?? [];
      } else if (weekday == 1) {
        selectedTimetableSlots = timetable.tuesday ?? [];
      } else if (weekday == 2) {
        selectedTimetableSlots = timetable.wednesday ?? [];
      } else if (weekday == 3) {
        selectedTimetableSlots = timetable.thursday ?? [];
      } else if (weekday == 4) {
        selectedTimetableSlots = timetable.friday ?? [];
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
