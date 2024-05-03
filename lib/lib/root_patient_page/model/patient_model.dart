import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

// {
//   "user": {
//     "id": 0,
//     "username": "OLb_U1M2ZJZtAJJZrfm0QDV7m52.cprwqQ97NCW@0A_vnlUN1f",
//     "email": "user@example.com",
//     "first_name": "string",
//     "last_name": "string"
//   },
//   "patient_fullname": "string",
//   "patient_birthdate": "2024-05-03",
//   "patient_phone": "string",
//   "patient_gender": "string"
// }

@JsonSerializable(includeIfNull: true)
class SignUpRequest {
  final String patient_fullname;
  final String patient_birthdate;
  final String patient_phone;
  final String patient_gender;
  final PatientAsUser user;

  SignUpRequest({
    required this.patient_fullname,
    required this.patient_birthdate,
    required this.patient_phone,
    required this.patient_gender,
    required this.user,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}

@JsonSerializable(includeIfNull: true)
class PatientAsUser {
  final String first_name;
  final String last_name;
  final String email;
  final String username;

  PatientAsUser({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.username,
  });

  factory PatientAsUser.fromJson(Map<String, dynamic> json) => _$PatientAsUserFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAsUserToJson(this);
}
