// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DoctorsServices extends DoctorsServices {
  _$DoctorsServices([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DoctorsServices;

  @override
  Future<Response<List<Clinic>>> getClinicsInfo() {
    final Uri $url = Uri.parse('https://wiut3.pythonanywhere.com/api/clinics/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Clinic>, Clinic>($request);
  }
}
