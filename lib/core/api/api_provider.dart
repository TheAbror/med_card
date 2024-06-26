import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:med_card/lib/app_updates_page/services/settings_service.dart';
import 'package:med_card/lib/doc_root_page/services/doctors_services.dart';
import 'package:med_card/lib/dr_iq/services/dr_iq_service.dart';
import 'package:med_card/lib/root_patient_page/services/auth_service.dart';
import 'auth_interceptor.dart';
import 'package:http/io_client.dart' as http;
import 'custom_converter.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late SettingsService settingsService;
  static late AuthService authService;
  static late DoctorsServices doctorsServices;
  static late DrIQService drIQService;

  static NotAuthorizedInterceptor notAuthorizedInterceptor = NotAuthorizedInterceptor();

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        SettingsService.create(),
        AuthService.create(),
        DoctorsServices.create(),
        DrIQService.create(),
      ],
      interceptors: getInterceptors(token: token),
      converter: CustomDataConverter(),
    );

    settingsService = _client.getService<SettingsService>();
    authService = _client.getService<AuthService>();
    doctorsServices = _client.getService<DoctorsServices>();
    drIQService = _client.getService<DrIQService>();
  }

  static List getInterceptors({String? token}) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(notAuthorizedInterceptor);

    interceptors.add(HeadersInterceptor(const {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      // HttpHeaders.authorizationHeader: token != null ? 'Token $token' : '',
      HttpHeaders.authorizationHeader: 'Token 75b0b2de0438f2c50f1a91bcb837ef5e6c6c4f15',
    }));

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
