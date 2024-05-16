// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeTableModel _$TimeTableModelFromJson(Map<String, dynamic> json) =>
    TimeTableModel(
      (json['monday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['tuesday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['wednesday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['thursday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['friday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['saturday'] as List<dynamic>?)
              ?.map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TimeTableModelToJson(TimeTableModel instance) =>
    <String, dynamic>{
      'monday': instance.monday?.map((e) => e.toJson()).toList(),
      'tuesday': instance.tuesday?.map((e) => e.toJson()).toList(),
      'wednesday': instance.wednesday?.map((e) => e.toJson()).toList(),
      'thursday': instance.thursday?.map((e) => e.toJson()).toList(),
      'friday': instance.friday?.map((e) => e.toJson()).toList(),
      'saturday': instance.saturday?.map((e) => e.toJson()).toList(),
    };

WeekDay _$WeekDayFromJson(Map<String, dynamic> json) => WeekDay(
      patientInfo: json['patientInfo'] == null
          ? null
          : PatientInfo.fromJson(json['patientInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeekDayToJson(WeekDay instance) => <String, dynamic>{
      'patientInfo': instance.patientInfo?.toJson(),
    };

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) => PatientInfo(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      phone_number: json['phone_number'] as String? ?? '',
      meeting_time: json['meeting_time'] as String? ?? '',
      topic: json['topic'] as String? ?? '',
      comments: json['comments'] as String? ?? '',
    );

Map<String, dynamic> _$PatientInfoToJson(PatientInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone_number': instance.phone_number,
      'meeting_time': instance.meeting_time,
      'topic': instance.topic,
      'comments': instance.comments,
    };
