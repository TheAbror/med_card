import 'package:json_annotation/json_annotation.dart';

part 'timetable_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TimeTableModel {
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

  TimeTableModel(
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  );

  factory TimeTableModel.fromJson(Map<String, dynamic> jsonData) =>
      _$TimeTableModelFromJson(jsonData);
  Map<String, dynamic> toJson() => _$TimeTableModelToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class WeekDay {
  @JsonKey()
  PatientInfo? patientInfo;

  WeekDay({required this.patientInfo});

  factory WeekDay.fromJson(Map<String, dynamic> json) => _$WeekDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekDayToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class PatientInfo {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: '')
  final String phone_number;
  @JsonKey(defaultValue: '')
  final String meeting_time;
  @JsonKey(defaultValue: '')
  final String topic;
  @JsonKey(defaultValue: '')
  final String comments;

  PatientInfo({
    required this.id,
    required this.fullName,
    required this.phone_number,
    required this.meeting_time,
    required this.topic,
    required this.comments,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) => _$PatientInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PatientInfoToJson(this);
}
