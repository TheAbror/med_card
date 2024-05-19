import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/api/api_provider.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/core/bloc_progress/error.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/lib/dr_iq/model/doctor_iq_model.dart';

part 'dr_iq_state.dart';

class DrIQBloc extends Cubit<DrIQState> {
  DrIQBloc() : super(DrIQState.initial());

  void getDRIQ(String sympthoms) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = DrIQRequest(symptoms: sympthoms);

    try {
      final response = await ApiProvider.drIQService.getDRIQ(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            drIQResponse: data,
            blocProgress: BlocProgress.LOADED,
          ));
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }
}
