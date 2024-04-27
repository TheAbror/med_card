import 'package:bot_toast/bot_toast.dart';
import 'package:med_card/core/router/main_route_generator.dart';

import 'core/api/api_logging.dart';
import 'core/api/api_provider.dart';
import 'core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/current_user/user_data.dart';
import 'lib/root_page/bloc/root_bloc.dart';
import 'core/current_user/project_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/current_user/user_data_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/lib/splash_page/bloc/splash_bloc.dart';

import 'lib/root_page/pages/localization/bloc/localization_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserDataAdapter());

  userDataBox = await Hive.openBox<UserData>(ProjectKeys.userData);

  ApiProvider.create();

  /// For logging
  setUpLogging();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RootBloc()),
            BlocProvider(create: (context) => SplashBloc()),
            BlocProvider(create: (_) => LocalizationBloc()..initLocalization()),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: lightTheme(),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MainRouteGenerator().generateRoute,
        );
      },
    );
  }
}
