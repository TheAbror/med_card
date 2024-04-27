part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final SignInResponse data;
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
      data: SignInResponse(
        token: '',
        userInfo: UserInfoResponse(
          id: 0,
          firstname: '',
          lastname: '',
          accountType: '',
          status: '',
          username: 0,
          email: '',
          roles: [],
          institutionInfo: InstitutionResponse(id: 1, title: ''),
          academicYears: [],
        ),
      ),
      accountType: AccountType.unknown,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  AuthState copyWith({
    SignInResponse? data,
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
