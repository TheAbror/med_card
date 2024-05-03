// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      patient_fullname: json['patient_fullname'] as String,
      patient_birthdate: json['patient_birthdate'] as String,
      patient_phone: json['patient_phone'] as String,
      patient_gender: json['patient_gender'] as String,
      user: PatientAsUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'patient_fullname': instance.patient_fullname,
      'patient_birthdate': instance.patient_birthdate,
      'patient_phone': instance.patient_phone,
      'patient_gender': instance.patient_gender,
      'user': instance.user,
    };

PatientAsUser _$PatientAsUserFromJson(Map<String, dynamic> json) =>
    PatientAsUser(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$PatientAsUserToJson(PatientAsUser instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'username': instance.username,
    };
