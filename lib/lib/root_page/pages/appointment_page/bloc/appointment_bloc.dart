import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';

part 'appointment_state.dart';

class AppointmentBloc extends Cubit<AppointmentState> {
  AppointmentBloc() : super(AppointmentState.initial());

  void selectedIndex(int rowIndex, int colIndex) {
    emit(state.copyWith(rowIndex: rowIndex, colIndex: colIndex)); // Update selected indices
  }

  void clearAll() {
    emit(AppointmentState.initial());
  }
}
