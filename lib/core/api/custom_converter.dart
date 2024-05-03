// ignore_for_file: type_literal_in_constant_pattern

import 'package:chopper/chopper.dart';
import 'package:med_card/lib/app_updates_page/models/app_version_response.dart';
import 'package:med_card/lib/root_patient_page/model/patient_model.dart';

class CustomDataConverter extends JsonConverter {
  @override
  Future<Response<BodyType>> convertResponse<BodyType, InnerType>(Response response) async {
    final Response<dynamic> dynamicResponse = await super.convertResponse(response);

    var body = dynamicResponse.body;

    final BodyType customBody = convertToCustomObject<BodyType, InnerType>(body);

    return dynamicResponse.copyWith<BodyType>(
      body: customBody,
    );
  }
}

BodyType convertToCustomObject<BodyType, SingleItemType>(dynamic element) {
  if (element is List) {
    return deserializeListOf<BodyType, SingleItemType>(element);
  } else {
    return deserialize<SingleItemType>(element);
  }
}

dynamic deserializeListOf<BodyType, SingleItemType>(
  List dynamicList,
) {
  List<SingleItemType> list =
      dynamicList.map<SingleItemType>((element) => deserialize<SingleItemType>(element)).toList();
  return list;
}

dynamic deserialize<SingleItemType>(Map<String, dynamic> json) {
  switch (SingleItemType) {
    case int:
      return int;

    case AppVersionResponse:
      return AppVersionResponse.fromJson(json);

    case SignInRequest:
      return SignInRequest.fromJson(json);
    case PatientAsUser:
      return PatientAsUser.fromJson(json);

    default:
      return null;
  }
}
