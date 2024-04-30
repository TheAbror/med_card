// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'udea_timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimetableResponse _$TimetableResponseFromJson(Map<String, dynamic> json) =>
    TimetableResponse(
      generalInfo: json['general_info'] == null
          ? null
          : GeneralInfo.fromJson(json['general_info'] as Map<String, dynamic>),
      slots: json['slots'] == null
          ? null
          : Slots.fromJson(json['slots'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimetableResponseToJson(TimetableResponse instance) =>
    <String, dynamic>{
      'general_info': instance.generalInfo?.toJson(),
      'slots': instance.slots?.toJson(),
    };

GeneralInfo _$GeneralInfoFromJson(Map<String, dynamic> json) => GeneralInfo(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => GroupsTimetable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      teachers: (json['teachers'] as List<dynamic>?)
              ?.map(
                  (e) => TeachersTimetable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => RoomsTimetable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GeneralInfoToJson(GeneralInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
      'teachers': instance.teachers?.map((e) => e.toJson()).toList(),
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
    };

GroupsTimetable _$GroupsTimetableFromJson(Map<String, dynamic> json) =>
    GroupsTimetable(
      id: json['strId'] as String? ?? '',
      short: json['short'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GroupsTimetableToJson(GroupsTimetable instance) =>
    <String, dynamic>{
      'strId': instance.id,
      'name': instance.name,
      'short': instance.short,
    };

TeachersTimetable _$TeachersTimetableFromJson(Map<String, dynamic> json) =>
    TeachersTimetable(
      id: json['strId'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      name: json['name'] as String? ?? '',
      short: json['short'] as String? ?? '',
    );

Map<String, dynamic> _$TeachersTimetableToJson(TeachersTimetable instance) =>
    <String, dynamic>{
      'strId': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'name': instance.name,
      'short': instance.short,
    };

RoomsTimetable _$RoomsTimetableFromJson(Map<String, dynamic> json) =>
    RoomsTimetable(
      id: json['strId'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$RoomsTimetableToJson(RoomsTimetable instance) =>
    <String, dynamic>{
      'strId': instance.id,
      'name': instance.name,
    };

Slots _$SlotsFromJson(Map<String, dynamic> json) => Slots(
      filteredBy: json['filtered_by'] == null
          ? null
          : FilteredBy.fromJson(json['filtered_by'] as Map<String, dynamic>),
      monday: (json['monday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..tuesday = (json['tuesday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..wednesday = (json['wednesday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..thursday = (json['thursday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..friday = (json['friday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..saturday = (json['saturday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$SlotsToJson(Slots instance) => <String, dynamic>{
      'filtered_by': instance.filteredBy?.toJson(),
      'monday': instance.monday?.map((e) => e.toJson()).toList(),
      'tuesday': instance.tuesday?.map((e) => e.toJson()).toList(),
      'wednesday': instance.wednesday?.map((e) => e.toJson()).toList(),
      'thursday': instance.thursday?.map((e) => e.toJson()).toList(),
      'friday': instance.friday?.map((e) => e.toJson()).toList(),
      'saturday': instance.saturday?.map((e) => e.toJson()).toList(),
    };

FilteredBy _$FilteredByFromJson(Map<String, dynamic> json) => FilteredBy(
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
      defaultValue: json['default_value'] as bool? ?? false,
    );

Map<String, dynamic> _$FilteredByToJson(FilteredBy instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'default_value': instance.defaultValue,
    };

WeekDay _$WeekDayFromJson(Map<String, dynamic> json) => WeekDay(
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      classroom: json['classroom'] == null
          ? null
          : ClassRoom.fromJson(json['classroom'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      teacher: json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeekDayToJson(WeekDay instance) => <String, dynamic>{
      'period': instance.period?.toJson(),
      'classroom': instance.classroom?.toJson(),
      'subject': instance.subject?.toJson(),
      'teacher': instance.teacher?.toJson(),
    };

Period _$PeriodFromJson(Map<String, dynamic> json) => Period(
      id: json['id'] as int? ?? 0,
      starttime: json['starttime'] as String? ?? '',
      endtime: json['endtime'] as String? ?? '',
    );

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'id': instance.id,
      'starttime': instance.starttime,
      'endtime': instance.endtime,
    };

ClassRoom _$ClassRoomFromJson(Map<String, dynamic> json) => ClassRoom(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ClassRoomToJson(ClassRoom instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      id: json['id'] as int? ?? 0,
      stringId: json['str_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'str_id': instance.stringId,
      'name': instance.name,
    };

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'] as int? ?? 0,
      name: json['teacherName'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'teacherName': instance.name,
    };
