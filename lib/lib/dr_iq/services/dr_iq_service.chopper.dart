// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dr_iq_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DrIQService extends DrIQService {
  _$DrIQService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DrIQService;

  @override
  Future<Response<DrIQResponse>> getDRIQ(DrIQRequest body) {
    final Uri $url = Uri.parse('http://192.168.147.30:8000/api/recommend-doc');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<DrIQResponse, DrIQResponse>($request);
  }
}
