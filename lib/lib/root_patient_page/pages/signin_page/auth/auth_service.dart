import 'package:chopper/chopper.dart';
import 'package:med_card/core/utils/app_strings.dart';

import 'model/user_info.dart';
import 'models/auth.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client ?? ChopperClient());

  @Post(path: AppStrings.signIn)
  Future<Response<SignInResponse>> signIn(@Body() SignInRequest body);
}
