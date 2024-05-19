import 'package:json_annotation/json_annotation.dart';

part 'doctor_iq_model.g.dart';

@JsonSerializable(includeIfNull: true)
class DrIQRequest {
  final String symptoms;

  DrIQRequest({required this.symptoms});

  factory DrIQRequest.fromJson(Map<String, dynamic> json) => _$DrIQRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DrIQRequestToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DrIQResponse {
  final List<Map<String, String>> data;

  DrIQResponse({required this.data});

  factory DrIQResponse.fromJson(Map<String, dynamic> json) => _$DrIQResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DrIQResponseToJson(this);
}
