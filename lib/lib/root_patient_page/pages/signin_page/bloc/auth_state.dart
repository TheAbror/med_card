part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final SignInRequest data;
  final bool isPasswordHidden;
  final BlocProgress blocProgress;
  final AccountType accountType;
  final String failureMessage;

  const AuthState({
    required this.isPasswordHidden,
    required this.data,
    required this.blocProgress,
    required this.accountType,
    required this.failureMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      isPasswordHidden: true,
      data: SignInRequest(
        patient_birthdate: '',
        patient_fullname: '',
        patient_gender: '',
        patient_phone: '',
        user: PatientAsUser(
          password: '',
          email: '',
          username: '',
        ),
      ),
      accountType: AccountType.unknown,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  AuthState copyWith({
    SignInRequest? data,
    bool? isPasswordHidden,
    BlocProgress? blocProgress,
    AccountType? accountType,
    String? failureMessage,
  }) {
    return AuthState(
      data: data ?? this.data,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      blocProgress: blocProgress ?? this.blocProgress,
      accountType: accountType ?? this.accountType,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        isPasswordHidden,
        data,
        blocProgress,
        failureMessage,
        accountType,
      ];
}
