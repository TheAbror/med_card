import 'package:json_annotation/json_annotation.dart';

part 'doctor_models.g.dart';

@JsonSerializable(includeIfNull: true)
class DoctorsModel {
  final DoctorUsername doctor_username;
  final String doctor_fullname;
  final String doctor_birthdate;
  final String doctor_phone;
  final String doctor_license_no;
  final Clinic clinic; //TODO fix model
  final SpecialityName speciality_name;
  final List<Review> reviews;
  final List<Experience> experiences;
  final List<Qualification> qualifications;
  final List<Availability> availabilities;

  DoctorsModel({
    required this.doctor_username,
    required this.doctor_fullname,
    required this.doctor_birthdate,
    required this.doctor_phone,
    required this.doctor_license_no,
    required this.clinic,
    required this.speciality_name,
    required this.reviews,
    required this.experiences,
    required this.qualifications,
    required this.availabilities,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) => _$DoctorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DoctorUsername {
  final String username;
  final String email;

  DoctorUsername({required this.username, required this.email});

  factory DoctorUsername.fromJson(Map<String, dynamic> json) => _$DoctorUsernameFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorUsernameToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Clinic {
  final String clinic_name;
  final String contacts;
  final String address;

  Clinic({
    required this.clinic_name,
    required this.contacts,
    required this.address,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}

@JsonSerializable(includeIfNull: true)
class SpecialityName {
  final String speciality_name;

  SpecialityName({required this.speciality_name});

  factory SpecialityName.fromJson(Map<String, dynamic> json) => _$SpecialityNameFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityNameToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Review {
  final int rating;
  final String review;

  Review({required this.rating, required this.review});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Experience {
  final String place_of_experience;
  final String start_year;
  final String end_year;
  final String position;
  final String description;

  Experience({
    required this.place_of_experience,
    required this.start_year,
    required this.end_year,
    required this.position,
    required this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Qualification {
  final String qualification;
  final String institution;
  final String year_obtained;

  Qualification({
    required this.qualification,
    required this.institution,
    required this.year_obtained,
  });

  factory Qualification.fromJson(Map<String, dynamic> json) => _$QualificationFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Availability {
  final String day_of_week;
  final String start_time;
  final String end_time;

  Availability({
    required this.day_of_week,
    required this.start_time,
    required this.end_time,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => _$AvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}
