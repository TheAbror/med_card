// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SettingsService extends SettingsService {
  _$SettingsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SettingsService;

  @override
  Future<Response<AppVersionResponse>> getAppVersions() {
    final Uri $url = Uri.parse(
        'http://192.168.100.17:8100/short_course/api/v1/mobile_settings');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AppVersionResponse, AppVersionResponse>($request);
  }
}
