part of 'doctor_bloc.dart';

class DoctorState extends Equatable {
  final DoctorsModel data;
  final BlocProgress blocProgress;
  final String failureMessage;

  const DoctorState({
    required this.data,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory DoctorState.initial() {
    return DoctorState(
      data: DoctorsModel(
        doctor_birthdate: '',
        doctor_fullname: '',
        doctor_license_no: '',
        doctor_phone: '',
        doctor_username: DoctorUsername(username: '', email: ''),
        clinic: Clinic(clinic_name: '', contacts: '', address: ''),
        speciality_name: SpecialityName(speciality_name: ''),
        reviews: [],
        experiences: [],
        qualifications: [],
        availabilities: [],
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  DoctorState copyWith({
    DoctorsModel? data,
    bool? isPasswordHidden,
    BlocProgress? blocProgress,
    AccountType? accountType,
    String? failureMessage,
  }) {
    return DoctorState(
      data: data ?? this.data,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        data,
        blocProgress,
        failureMessage,
      ];
}
