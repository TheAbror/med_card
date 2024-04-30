import 'package:json_annotation/json_annotation.dart';

part 'udea_timetable.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TimetableResponse {
  @JsonKey(name: 'general_info')
  GeneralInfo? generalInfo;
  @JsonKey()
  Slots? slots;

  TimetableResponse({
    required this.generalInfo,
    required this.slots,
  });

  factory TimetableResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$TimetableResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$TimetableResponseToJson(this);
}

//                                                                    //
//                            General                                   //
//                                                                    //

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class GeneralInfo {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: [])
  List<GroupsTimetable>? groups;
  @JsonKey(defaultValue: [])
  List<TeachersTimetable>? teachers;
  @JsonKey(defaultValue: [])
  List<RoomsTimetable>? rooms;

  GeneralInfo({
    required this.id,
    required this.title,
    this.groups,
    this.teachers,
    this.rooms,
  });

  factory GeneralInfo.fromJson(Map<String, dynamic> jsonData) => _$GeneralInfoFromJson(jsonData);
  Map<String, dynamic> toJson() => _$GeneralInfoToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class GroupsTimetable {
  @JsonKey(defaultValue: '', name: 'strId')
  final String id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String short;

  GroupsTimetable({
    required this.id,
    required this.short,
    required this.name,
  });

  factory GroupsTimetable.fromJson(Map<String, dynamic> json) => _$GroupsTimetableFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsTimetableToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TeachersTimetable {
  @JsonKey(defaultValue: '', name: 'strId')
  final String id;
  @JsonKey(defaultValue: '')
  final String firstname;
  @JsonKey(defaultValue: '')
  final String lastname;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String short;

  TeachersTimetable({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.name,
    required this.short,
  });

  factory TeachersTimetable.fromJson(Map<String, dynamic> json) =>
      _$TeachersTimetableFromJson(json);

  Map<String, dynamic> toJson() => _$TeachersTimetableToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class RoomsTimetable {
  @JsonKey(defaultValue: '', name: 'strId')
  final String id;
  @JsonKey(defaultValue: '')
  final String name;

  RoomsTimetable({
    required this.id,
    required this.name,
  });

  factory RoomsTimetable.fromJson(Map<String, dynamic> json) => _$RoomsTimetableFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsTimetableToJson(this);
}

//                                                                    //
//                            SLOTS                                   //
//                                                                    //

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Slots {
  @JsonKey(name: 'filtered_by')
  FilteredBy? filteredBy;
  @JsonKey(defaultValue: [])
  List<WeekDay>? monday;
  @JsonKey(defaultValue: [])
  List<WeekDay>? tuesday;
  @JsonKey(defaultValue: [])
  List<WeekDay>? wednesday;
  @JsonKey(defaultValue: [])
  List<WeekDay>? thursday;
  @JsonKey(defaultValue: [])
  List<WeekDay>? friday;
  @JsonKey(defaultValue: [])
  List<WeekDay>? saturday;

  Slots({
    this.filteredBy,
    this.monday,
  });

  factory Slots.fromJson(Map<String, dynamic> jsonData) => _$SlotsFromJson(jsonData);
  Map<String, dynamic> toJson() => _$SlotsToJson(this);
}
// "current_group": {
// 			"name": "MMT-03",
// 			"short": "MMT-03"
// 		},

//  "filtered_by": {
//             "label": "Group",
//             "value": "MMT-1-23",
//             "default_value": true
//         },

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class FilteredBy {
  @JsonKey(defaultValue: '')
  final String label;
  @JsonKey(defaultValue: '')
  final String value;
  @JsonKey(defaultValue: false, name: 'default_value')
  final bool defaultValue;

  FilteredBy({
    required this.label,
    required this.value,
    required this.defaultValue,
  });

  factory FilteredBy.fromJson(Map<String, dynamic> json) => _$FilteredByFromJson(json);

  Map<String, dynamic> toJson() => _$FilteredByToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class WeekDay {
  //ADD DAY
  @JsonKey()
  Period? period;
  @JsonKey()
  ClassRoom? classroom;
  @JsonKey()
  Subject? subject;
  @JsonKey()
  Teacher? teacher;

  WeekDay({
    required this.period,
    required this.classroom,
    required this.subject,
    required this.teacher,
  });

  factory WeekDay.fromJson(Map<String, dynamic> json) => _$WeekDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekDayToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Period {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String starttime;
  @JsonKey(defaultValue: '')
  final String endtime;

  Period({
    required this.id,
    required this.starttime,
    required this.endtime,
  });

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ClassRoom {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;

  ClassRoom({
    required this.id,
    required this.name,
  });

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Subject {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(name: 'str_id', defaultValue: '')
  final String stringId;
  @JsonKey(defaultValue: '')
  final String name;

  Subject({
    required this.id,
    required this.stringId,
    required this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Teacher {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '', name: 'teacherName')
  final String name;

  Teacher({
    required this.id,
    required this.name,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
