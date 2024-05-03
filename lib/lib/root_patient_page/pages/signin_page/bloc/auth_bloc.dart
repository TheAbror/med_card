import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/api/api_provider.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/core/bloc_progress/error.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/lib/splash_page/auth_status/account_type.dart';

import '../../../model/patient_model.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.initial());

  void clearAll() {
    emit(AuthState.initial());
  }

  void signIn(String username, String password) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = SignInRequest(
      patient_birthdate: '2001-04-23',
      patient_fullname: 'dasdas',
      patient_gender: 'dasd',
      patient_phone: '9982341234',
      user: PatientAsUser(
        password: 'dasd',
        email: 'dasda@gmail.com',
        username: '1234213',
      ),
    );

    try {
      final response = await ApiProvider.authService.signIN(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          // final token = data.token;

          // ApiProvider.create(token: token);

          emit(
            state.copyWith(
              // data: data,
              blocProgress: BlocProgress.IS_SUCCESS,
              // accountType: accountType,
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
      debugPrint('Error getting inquiries: $e');
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }

  void isPasswordHidden() {
    final item = !state.isPasswordHidden;
    emit(state.copyWith(isPasswordHidden: item));
  }

  // ignore: unused_element
  AccountType _getAccountTypeFromRoles(List<String> roles) {
    if (roles.any((e) => e == AppRoles.superAdmin)) {
      return AccountType.superAdmin;
    }

    if (roles.any((e) => e == AppRoles.director)) {
      return AccountType.director;
    }

    if (roles.any((e) => e == AppRoles.staff)) {
      return AccountType.staff;
    }

    if (roles.any(
      (e) => e == AppRoles.bachelorStudent || e == AppRoles.masterStudent,
    )) {
      return AccountType.student;
    }

    return AccountType.unknown;
  }
}

abstract class AppRoles {
  static const superAdmin = 'SUPER_ADMIN';
  static const director = 'DIRECTOR';
  static const staff = 'STAFF';
  static const bachelorStudent = 'BACHELOR_STUDENT';
  static const masterStudent = 'MASTER_STUDENT';
}
