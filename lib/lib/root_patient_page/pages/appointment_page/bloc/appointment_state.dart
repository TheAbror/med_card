part of 'appointment_bloc.dart';

class AppointmentState extends Equatable {
  final int rowIndex;
  final int colIndex;
  final BlocProgress blocProgress;
  final String failureMessage;

  const AppointmentState({
    required this.rowIndex,
    required this.colIndex,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory AppointmentState.initial() {
    return AppointmentState(
      rowIndex: 0,
      colIndex: 0,
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  AppointmentState copyWith({
    int? rowIndex,
    int? colIndex,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return AppointmentState(
      rowIndex: rowIndex ?? this.rowIndex,
      colIndex: colIndex ?? this.colIndex,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        rowIndex,
        colIndex,
        blocProgress,
        failureMessage,
      ];
}
