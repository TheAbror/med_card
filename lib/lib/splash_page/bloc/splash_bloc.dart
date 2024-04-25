import 'dart:io';
import 'dart:convert';
import 'package:med_card/core/current_user/project_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_status/splash_auth_status.dart';
import 'package:med_card/core/api/api_provider.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/core/bloc_progress/error.dart';
import 'package:med_card/core/current_user/user_data.dart';
import 'package:med_card/core/current_user/user_data_box.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/lib/splash_page/auth_status/account_type.dart';
import 'package:med_card/lib/app_updates_page/models/app_version_response.dart';

part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState.initial());

  Future setupInitialSettings() async {
    UserData? userData = userDataBox.get(ProjectKeys.userData);

    ApiProvider.create(token: userData?.token ?? '');

    if (userData?.token != null && userData?.token.isNotEmpty == true) {
      emit(state.copyWith(authStatus: SplashAuthStatus.authorized));
    } else {
      emit(state.copyWith(authStatus: SplashAuthStatus.notAuthorized));
    }
  }

  void getMinimumAppVersion() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await ApiProvider.settingsService.getAppVersions();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              appVersionData: data,
              minVersion: Platform.isAndroid ? data.androidMinVersion : data.iosMinVersion,
              latestAppVersion:
                  Platform.isAndroid ? data.androidLatestVersion : data.iosLatestVersion,
              blocProgress: BlocProgress.LOADED,
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
      debugPrint('$e');
    }

    emit(state.copyWith(blocProgress: BlocProgress.LOADED));

    // PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // int buildNumber = int.parse(packageInfo.buildNumber.split('.').last);
    int buildNumber = 0;

    emit(state.copyWith(buildNumber: buildNumber));

    if (state.appVersionData.showMaintanance ||
        buildNumber < state.minVersion ||
        buildNumber < state.latestAppVersion) {
      emit(state.copyWith(showAppUpdatesPage: true));
    } else {
      setupInitialSettings();
    }
  }

  void clearAll() {
    emit(SplashState.initial());
  }
}
