import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SignInResponse {
  @JsonKey()
  String token;
  @JsonKey(name: 'user_info')
  UserInfoResponse userInfo;

  SignInResponse({required this.token, required this.userInfo});

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UserInfoResponse {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 'error occured')
  String firstname;
  @JsonKey(defaultValue: '')
  String lastname;
  //udea§
  @JsonKey(defaultValue: 0)
  int username;
  @JsonKey(name: 'account_type', defaultValue: '')
  String accountType;
  @JsonKey(defaultValue: '')
  String status;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(defaultValue: [''])
  List<String> roles;
  @JsonKey(name: 'institution_info')
  InstitutionResponse institutionInfo;
  @JsonKey(defaultValue: [], name: 'academic_years')
  List<AcademicYearResponse> academicYears;

  UserInfoResponse({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.accountType,
    required this.status,
    required this.username,
    required this.email,
    required this.roles,
    required this.institutionInfo,
    required this.academicYears,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class InstitutionResponse {
  @JsonKey(defaultValue: 1)
  int id;
  @JsonKey(defaultValue: '')
  String title;

  InstitutionResponse({
    required this.id,
    required this.title,
  });

  factory InstitutionResponse.fromJson(Map<String, dynamic> json) =>
      _$InstitutionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AcademicYearResponse {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String type;

  AcademicYearResponse({
    required this.id,
    required this.name,
    required this.type,
  });

  factory AcademicYearResponse.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AcademicYearResponseToJson(this);
}
