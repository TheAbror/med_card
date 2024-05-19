part of 'dr_iq_bloc.dart';

class DrIQState extends Equatable {
  final DrIQResponse drIQResponse;
  final BlocProgress blocProgress;
  final String failureMessage;

  const DrIQState({
    required this.drIQResponse,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory DrIQState.initial() {
    return DrIQState(
      drIQResponse: DrIQResponse(data: []),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
      // app status variables
    );
  }

  DrIQState copyWith({
    BlocProgress? blocProgress,
    String? failureMessage,
    DrIQResponse? drIQResponse,
  }) {
    return DrIQState(
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
      drIQResponse: drIQResponse ?? this.drIQResponse,
    );
  }

  @override
  List<Object?> get props => [
        blocProgress,
        failureMessage,
        drIQResponse,
      ];
}
