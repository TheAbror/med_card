import 'package:chopper/chopper.dart';
import 'package:med_card/core/utils/app_strings.dart';

import '../model/patient_model.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client ?? ChopperClient());

  @Post(path: AppStrings.signIn)
  Future<Response<PatientAsUser>> signIN(@Body() SignInRequest body);
}
