import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:med_card/lib/app_updates_page/services/settings_service.dart';
import 'auth_interceptor.dart';
import 'package:http/io_client.dart' as http;
import 'custom_converter.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late SettingsService settingsService;
  static NotAuthorizedInterceptor notAuthorizedInterceptor = NotAuthorizedInterceptor();

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        SettingsService.create(),
      ],
      interceptors: getInterceptors(token: token),
      converter: CustomDataConverter(),
    );

    settingsService = _client.getService<SettingsService>();
  }

  static List getInterceptors({String? token}) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(notAuthorizedInterceptor);

    interceptors.add(HeadersInterceptor({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
    }));

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
