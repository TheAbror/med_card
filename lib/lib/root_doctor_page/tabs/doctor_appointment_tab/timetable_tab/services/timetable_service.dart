// import 'package:chopper/chopper.dart';
// import 'package:my_udea/core/constants/app_strings.dart';
// import 'package:my_udea/ui_student/tabs/tabs/timetable_tab/model/udea_timetable.dart';

// part 'timetable_service.chopper.dart';

// @ChopperApi(baseUrl: AppStrings.baseLive)
// abstract class TimetableService extends ChopperService {
//   static TimetableService create([ChopperClient? client]) =>
//       _$TimetableService(client ?? ChopperClient());

//   @Get(path: AppStrings.timetable)
//   Future<Response<TimetableResponse>> getTimetableInitial();

//   @Get(path: '${AppStrings.timetable}?group_id={group_id}')
//   Future<Response<TimetableResponse>> getGroupInfo({@Path('group_id') String? group_id});

//   @Get(path: '${AppStrings.timetable}?teacher_id={teacher_id}')
//   Future<Response<TimetableResponse>> getTeacherInfo({@Path('teacher_id') String? teacher_id});

//   @Get(path: '${AppStrings.timetable}?room_id={room_id}')
//   Future<Response<TimetableResponse>> getRoomInfo({@Path('room_id') String? room_id});
// }
