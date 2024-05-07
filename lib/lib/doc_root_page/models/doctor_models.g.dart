// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) => Clinic(
      clinic_name: json['clinic_name'] as String,
      contacts: json['contacts'] as String,
      address: json['address'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'clinic_name': instance.clinic_name,
      'contacts': instance.contacts,
      'address': instance.address,
      'doctors': instance.doctors,
    };

DoctorsModel _$DoctorsModelFromJson(Map<String, dynamic> json) => DoctorsModel(
      doctor_username: DoctorUsername.fromJson(
          json['doctor_username'] as Map<String, dynamic>),
      doctor_fullname: json['doctor_fullname'] as String,
      doctor_birthdate: json['doctor_birthdate'] as String,
      doctor_phone: json['doctor_phone'] as String,
      doctor_license_no: json['doctor_license_no'] as String,
      speciality_name: SpecialityName.fromJson(
          json['speciality_name'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      qualifications: (json['qualifications'] as List<dynamic>)
          .map((e) => Qualification.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilities: (json['availabilities'] as List<dynamic>)
          .map((e) => Availability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorsModelToJson(DoctorsModel instance) =>
    <String, dynamic>{
      'doctor_username': instance.doctor_username,
      'doctor_fullname': instance.doctor_fullname,
      'doctor_birthdate': instance.doctor_birthdate,
      'doctor_phone': instance.doctor_phone,
      'doctor_license_no': instance.doctor_license_no,
      'speciality_name': instance.speciality_name,
      'reviews': instance.reviews,
      'experiences': instance.experiences,
      'qualifications': instance.qualifications,
      'availabilities': instance.availabilities,
    };

DoctorUsername _$DoctorUsernameFromJson(Map<String, dynamic> json) =>
    DoctorUsername(
      username: json['username'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$DoctorUsernameToJson(DoctorUsername instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
    };

SpecialityName _$SpecialityNameFromJson(Map<String, dynamic> json) =>
    SpecialityName(
      speciality_name: json['speciality_name'] as String,
    );

Map<String, dynamic> _$SpecialityNameToJson(SpecialityName instance) =>
    <String, dynamic>{
      'speciality_name': instance.speciality_name,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      rating: json['rating'] as int,
      review: json['review'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'rating': instance.rating,
      'review': instance.review,
    };

Experience _$ExperienceFromJson(Map<String, dynamic> json) => Experience(
      place_of_experience: json['place_of_experience'] as String,
      start_year: json['start_year'] as String,
      end_year: json['end_year'] as String,
      position: json['position'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'place_of_experience': instance.place_of_experience,
      'start_year': instance.start_year,
      'end_year': instance.end_year,
      'position': instance.position,
      'description': instance.description,
    };

Qualification _$QualificationFromJson(Map<String, dynamic> json) =>
    Qualification(
      qualification: json['qualification'] as String,
      institution: json['institution'] as String,
      year_obtained: json['year_obtained'] as String,
    );

Map<String, dynamic> _$QualificationToJson(Qualification instance) =>
    <String, dynamic>{
      'qualification': instance.qualification,
      'institution': instance.institution,
      'year_obtained': instance.year_obtained,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
      day_of_week: json['day_of_week'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
    );

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'day_of_week': instance.day_of_week,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };
