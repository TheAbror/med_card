// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      token: json['token'] as String,
      userInfo:
          UserInfoResponse.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user_info': instance.userInfo.toJson(),
    };

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      id: json['id'] as int? ?? 0,
      firstname: json['firstname'] as String? ?? 'error occured',
      lastname: json['lastname'] as String? ?? '',
      accountType: json['account_type'] as String? ?? '',
      status: json['status'] as String? ?? '',
      username: json['username'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [''],
      institutionInfo: InstitutionResponse.fromJson(
          json['institution_info'] as Map<String, dynamic>),
      academicYears: (json['academic_years'] as List<dynamic>?)
              ?.map((e) =>
                  AcademicYearResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.username,
      'account_type': instance.accountType,
      'status': instance.status,
      'email': instance.email,
      'roles': instance.roles,
      'institution_info': instance.institutionInfo.toJson(),
      'academic_years': instance.academicYears.map((e) => e.toJson()).toList(),
    };

InstitutionResponse _$InstitutionResponseFromJson(Map<String, dynamic> json) =>
    InstitutionResponse(
      id: json['id'] as int? ?? 1,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$InstitutionResponseToJson(
        InstitutionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

AcademicYearResponse _$AcademicYearResponseFromJson(
        Map<String, dynamic> json) =>
    AcademicYearResponse(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$AcademicYearResponseToJson(
        AcademicYearResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
