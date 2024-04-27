import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void changeTabIndex(int index) {
    emit(state.copyWith(tabIndex: index));
  }

  void clearAll() {
    emit(RootState.initial());
  }
}
