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
  final TimeTableModel? timetable;
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
      timetable: TimeTableModel(
        [
          WeekDay(
            patientInfo: PatientInfo(
              id: 10,
              fullName: 'Bakhtiyor Nurmatov',
              phone_number: '998911234567',
              meeting_time: '16:00',
              topic: 'Orthopedic consultation',
              comments: 'Wear comfortable clothing',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 11,
              fullName: 'Zarina Ismailova',
              phone_number: '998913456789',
              meeting_time: '12:30',
              topic: 'Pregnancy check-up',
              comments: 'Bring medical history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 12,
              fullName: 'Oybek Kadyrov',
              phone_number: '998915678901',
              meeting_time: '15:00',
              topic: 'Skin consultation',
              comments: 'Avoid using skin products before visit',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 13,
              fullName: 'Mavjuda Rakhmonova',
              phone_number: '998917890123',
              meeting_time: '17:00',
              topic: 'Cardiology appointment',
              comments: 'Bring previous ECG results',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 1,
              fullName: 'Farruh Abdullaev',
              phone_number: '998112233445',
              meeting_time: '10:30',
              topic: 'Regular checkup',
              comments: '',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 5,
              fullName: 'Gulnara Karimova',
              phone_number: '998901234567',
              meeting_time: '09:00',
              topic: 'Dental check-up',
              comments: 'Review dental history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 6,
              fullName: 'Rustam Tashkentov',
              phone_number: '998903456789',
              meeting_time: '11:00',
              topic: 'Routine physical exam',
              comments: 'Fast for 12 hours before',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 7,
              fullName: 'Feruza Akhmedova',
              phone_number: '998905678901',
              meeting_time: '14:00',
              topic: 'Eye examination',
              comments: 'Bring previous eye exam reports',
            ),
          ),
        ],
        [
          WeekDay(
            patientInfo: PatientInfo(
              id: 2,
              fullName: 'Dilfuza Rahimova',
              phone_number: '998998887766',
              meeting_time: '11:15',
              topic: 'Follow-up appointment',
              comments: 'Bring medical reports',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 8,
              fullName: 'Anvar Rashidov',
              phone_number: '998907890123',
              meeting_time: '10:30',
              topic: 'Follow-up consultation',
              comments: 'Discuss test results',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 9,
              fullName: 'Dilnoza Turgunova',
              phone_number: '998909876543',
              meeting_time: '13:00',
              topic: 'Nutrition counseling',
              comments: 'Bring food diary',
            ),
          ),
        ],
        [
          WeekDay(
            patientInfo: PatientInfo(
              id: 3,
              fullName: 'Nargiza Toshpulatova',
              phone_number: '998998998997',
              meeting_time: '14:00',
              topic: 'New patient consultation',
              comments: '',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 11,
              fullName: 'Zarina Ismailova',
              phone_number: '998913456789',
              meeting_time: '12:30',
              topic: 'Pregnancy check-up',
              comments: 'Bring medical history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 12,
              fullName: 'Oybek Kadyrov',
              phone_number: '998915678901',
              meeting_time: '15:00',
              topic: 'Skin consultation',
              comments: 'Avoid using skin products before visit',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 13,
              fullName: 'Mavjuda Rakhmonova',
              phone_number: '998917890123',
              meeting_time: '17:00',
              topic: 'Cardiology appointment',
              comments: 'Bring previous ECG results',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 1,
              fullName: 'Farruh Abdullaev',
              phone_number: '998112233445',
              meeting_time: '10:30',
              topic: 'Regular checkup',
              comments: '',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 5,
              fullName: 'Gulnara Karimova',
              phone_number: '998901234567',
              meeting_time: '09:00',
              topic: 'Dental check-up',
              comments: 'Review dental history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 6,
              fullName: 'Rustam Tashkentov',
              phone_number: '998903456789',
              meeting_time: '11:00',
              topic: 'Routine physical exam',
              comments: 'Fast for 12 hours before',
            ),
          ),
        ],
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
          WeekDay(
            patientInfo: PatientInfo(
              id: 10,
              fullName: 'Bakhtiyor Nurmatov',
              phone_number: '998911234567',
              meeting_time: '16:00',
              topic: 'Orthopedic consultation',
              comments: 'Wear comfortable clothing',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 11,
              fullName: 'Zarina Ismailova',
              phone_number: '998913456789',
              meeting_time: '12:30',
              topic: 'Pregnancy check-up',
              comments: 'Bring medical history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 12,
              fullName: 'Oybek Kadyrov',
              phone_number: '998915678901',
              meeting_time: '15:00',
              topic: 'Skin consultation',
              comments: 'Avoid using skin products before visit',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 13,
              fullName: 'Mavjuda Rakhmonova',
              phone_number: '998917890123',
              meeting_time: '17:00',
              topic: 'Cardiology appointment',
              comments: 'Bring previous ECG results',
            ),
          ),
        ],
        [
          WeekDay(
            patientInfo: PatientInfo(
              id: 11,
              fullName: 'Zarina Ismailova',
              phone_number: '998913456789',
              meeting_time: '12:30',
              topic: 'Pregnancy check-up',
              comments: 'Bring medical history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 12,
              fullName: 'Oybek Kadyrov',
              phone_number: '998915678901',
              meeting_time: '15:00',
              topic: 'Skin consultation',
              comments: 'Avoid using skin products before visit',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 13,
              fullName: 'Mavjuda Rakhmonova',
              phone_number: '998917890123',
              meeting_time: '17:00',
              topic: 'Cardiology appointment',
              comments: 'Bring previous ECG results',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 1,
              fullName: 'Farruh Abdullaev',
              phone_number: '998112233445',
              meeting_time: '10:30',
              topic: 'Regular checkup',
              comments: '',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 5,
              fullName: 'Gulnara Karimova',
              phone_number: '998901234567',
              meeting_time: '09:00',
              topic: 'Dental check-up',
              comments: 'Review dental history',
            ),
          ),
          WeekDay(
            patientInfo: PatientInfo(
              id: 6,
              fullName: 'Rustam Tashkentov',
              phone_number: '998903456789',
              meeting_time: '11:00',
              topic: 'Routine physical exam',
              comments: 'Fast for 12 hours before',
            ),
          ),
        ],
        [],
      ),
      selectedTimetableSlots: [
        WeekDay(
          patientInfo: PatientInfo(
            id: 2,
            fullName: 'Dilfuza Rahimova',
            phone_number: '998998887766',
            meeting_time: '11:15',
            topic: 'Follow-up appointment',
            comments: 'Bring medical reports',
          ),
        ),
        WeekDay(
          patientInfo: PatientInfo(
            id: 3,
            fullName: 'Nargiza Toshpulatova',
            phone_number: '998998998997',
            meeting_time: '14:00',
            topic: 'New patient consultation',
            comments: '',
          ),
        ),
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
        WeekDay(
          patientInfo: PatientInfo(
            id: 4,
            fullName: 'Abbosjon Umarov',
            phone_number: '998997997996',
            meeting_time: '15:30',
            topic: 'Consultation',
            comments: 'Bring vaccination record',
          ),
        ),
        WeekDay(
          patientInfo: PatientInfo(
            id: 14,
            fullName: 'Ulugbek Karimov',
            phone_number: '998919876543',
            meeting_time: '08:30',
            topic: 'ENT consultation',
            comments: 'List all symptoms',
          ),
        ),
      ],
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
    TimeTableModel? timetable,
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
