// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_iq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrIQRequest _$DrIQRequestFromJson(Map<String, dynamic> json) => DrIQRequest(
      symptoms: json['symptoms'] as String,
    );

Map<String, dynamic> _$DrIQRequestToJson(DrIQRequest instance) =>
    <String, dynamic>{
      'symptoms': instance.symptoms,
    };

DrIQResponse _$DrIQResponseFromJson(Map<String, dynamic> json) => DrIQResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$DrIQResponseToJson(DrIQResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
