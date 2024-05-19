import 'package:chopper/chopper.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/lib/dr_iq/model/doctor_iq_model.dart';

part 'dr_iq_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.drIQ)
abstract class DrIQService extends ChopperService {
  static DrIQService create([ChopperClient? client]) => _$DrIQService(client ?? ChopperClient());

  @Post(path: AppStrings.drIQ)
  Future<Response<DrIQResponse>> getDRIQ(@Body() DrIQRequest body);
}
