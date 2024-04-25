import 'package:chopper/chopper.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/lib/app_updates_page/models/app_version_response.dart';

part 'settings_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class SettingsService extends ChopperService {
  static SettingsService create([ChopperClient? client]) =>
      _$SettingsService(client ?? ChopperClient());

  @Get(path: AppStrings.appVersions)
  Future<Response<AppVersionResponse>> getAppVersions();
}
