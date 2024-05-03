import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

// {
//   "user": {
//     "username": "q0axu7t_nFr1.zf+bz96evD.xStvGL8v",
//     "password": "string",
//     "email": "user@example.com"
//   },
//   "patient_fullname": "string",
//   "patient_birthdate": "2024-05-03",
//   "patient_phone": "string",
//   "patient_gender": "string"
// }

@JsonSerializable(includeIfNull: true)
class SignInRequest {
  final String patient_fullname;
  final String patient_birthdate;
  final String patient_phone;
  final String patient_gender;
  final PatientAsUser user;

  SignInRequest({
    required this.patient_fullname,
    required this.patient_birthdate,
    required this.patient_phone,
    required this.patient_gender,
    required this.user,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

@JsonSerializable(includeIfNull: true)
class PatientAsUser {
  final String email;
  final String password;
  final String username;

  PatientAsUser({
    required this.password,
    required this.email,
    required this.username,
  });

  factory PatientAsUser.fromJson(Map<String, dynamic> json) => _$PatientAsUserFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAsUserToJson(this);
}
