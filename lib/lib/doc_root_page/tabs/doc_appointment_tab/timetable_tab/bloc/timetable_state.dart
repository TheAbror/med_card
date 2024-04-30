part of 'timetable_bloc.dart';

class TimetableState extends Equatable {
  final String titleText;
  final String mainSelectedValue;
  final String subTitleText;
  final List<String>? groupList;
  final List<String>? roomList;
  final List<String>? teacherList;
  final List<String>? shortWeekdays;
  final List<String>? studentsLevel;
  final int selectedWeekDay;
  final int selectedLevel;
  final List<DateTime>? weekDays;
  final TimetableResponse? timetable;
  final List<WeekDay> selectedTimetableSlots;
  final BlocProgress blocProgress;
  final String failureMessage;

  const TimetableState({
    required this.titleText,
    required this.mainSelectedValue,
    required this.subTitleText,
    this.groupList,
    this.roomList,
    this.teacherList,
    this.shortWeekdays,
    this.studentsLevel,
    this.selectedWeekDay = 0,
    this.selectedLevel = 0,
    this.weekDays,
    this.timetable,
    required this.selectedTimetableSlots,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory TimetableState.initial() {
    return TimetableState(
      titleText: '',
      mainSelectedValue: '',
      subTitleText: '',
      groupList: const [],
      roomList: const [],
      teacherList: const [],
      shortWeekdays: const [
        'MON',
        'TUE',
        'WED',
        'THU',
        'FRI',
        'SAT',
      ],
      studentsLevel: const [
        'LEVEL 4',
        'LEVEL 3',
        'LEVEL 2',
      ],
      selectedWeekDay: DateTime.now().weekday - 1,
      selectedLevel: 0,
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
      selectedTimetableSlots: const [],
      // weekDays: (DateTime.now()).toList().sublist(0, 6),
    );
  }

  TimetableState copyWith({
    String? titleText,
    String? mainSelectedValue,
    String? subTitleText,
    List<String>? groupList,
    List<String>? roomList,
    List<String>? teacherList,
    List<String>? shortWeekdays,
    List<String>? studentsLevel,
    int? selectedWeekDay,
    int? selectedLevel,
    List<DateTime>? weekDays,
    BlocProgress? blocProgress,
    String? failureMessage,
    TimetableResponse? timetable,
    List<WeekDay>? selectedTimetableSlots,
  }) {
    return TimetableState(
      titleText: titleText ?? this.titleText,
      mainSelectedValue: mainSelectedValue ?? this.mainSelectedValue,
      subTitleText: subTitleText ?? this.subTitleText,
      groupList: groupList ?? this.groupList,
      roomList: roomList ?? this.roomList,
      teacherList: teacherList ?? this.teacherList,
      shortWeekdays: shortWeekdays ?? this.shortWeekdays,
      studentsLevel: studentsLevel ?? this.studentsLevel,
      selectedWeekDay: selectedWeekDay ?? this.selectedWeekDay,
      selectedLevel: selectedLevel ?? this.selectedLevel,
      weekDays: weekDays ?? this.weekDays,
      timetable: timetable ?? this.timetable,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
      selectedTimetableSlots: selectedTimetableSlots ?? this.selectedTimetableSlots,
    );
  }

  @override
  List<Object?> get props => [
        titleText,
        mainSelectedValue,
        subTitleText,
        groupList,
        roomList,
        teacherList,
        shortWeekdays,
        studentsLevel,
        selectedWeekDay,
        selectedLevel,
        timetable,
        blocProgress,
        failureMessage,
        selectedTimetableSlots,
      ];
}
