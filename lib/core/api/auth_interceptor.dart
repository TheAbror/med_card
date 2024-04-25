import 'dart:async';

import 'package:chopper/chopper.dart';

import '../current_user/user_data.dart';
import '../current_user/user_data_box.dart';
import '../current_user/project_keys.dart';

class NotAuthorizedInterceptor implements ResponseInterceptor {
  final StreamController<bool> controller = StreamController<bool>.broadcast();

  @override
  FutureOr<Response> onResponse(Response response) {
    UserData? userData = userDataBox.get(ProjectKeys.userData);
    final token = userData?.token;

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 401) {
        controller.add(true);
      }
    }

    return response;
  }
}
