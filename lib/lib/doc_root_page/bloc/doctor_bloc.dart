import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/api/api_provider.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/core/bloc_progress/error.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/lib/doc_root_page/models/doctor_models.dart';
import 'package:med_card/lib/splash_page/auth_status/account_type.dart';

part 'doctor_state.dart';

class DoctorBloc extends Cubit<DoctorState> {
  DoctorBloc() : super(DoctorState.initial());

  void getClinicsInfo() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.doctorsServices.getClinicsInfo();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              data: data,
              blocProgress: BlocProgress.IS_SUCCESS,
            ),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }

  void clearAll() {
    emit(DoctorState.initial());
  }
}
