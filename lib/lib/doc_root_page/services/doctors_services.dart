import 'package:chopper/chopper.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/lib/doc_root_page/models/doctor_models.dart';

part 'doctors_services.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class DoctorsServices extends ChopperService {
  static DoctorsServices create([ChopperClient? client]) =>
      _$DoctorsServices(client ?? ChopperClient());

  @Get(path: AppStrings.clinics)
  Future<Response<List<DoctorsModel>>> getClinicsInfo();
}
