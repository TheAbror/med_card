import 'package:flutter/material.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/core/router/cupertino_style_navigation_route.dart';
import 'package:med_card/lib/root_doctor_page/root_doctor_page.dart';
import 'package:med_card/lib/root_page/pages/appointment_page/appointment_page.dart';
import 'package:med_card/lib/root_doctor_page/tabs/doctor_appointment_tab/doctor_appointment_tab.dart';
import 'package:med_card/lib/root_page/pages/signin_page/signin_page.dart';
import 'package:med_card/lib/root_page/root_page.dart';
import 'package:med_card/lib/root_page/tabs/home_tab/home_tab.dart';
import 'package:med_card/lib/splash_page/splash_page.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
      case AppRoutes.rootPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RootPage(),
        );
      case AppRoutes.homeTab:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const HomeTab(),
        );
      case AppRoutes.appointmentPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => AppointmentPage(),
        );
      case AppRoutes.doctorAppointmentPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => DoctorAppointmentTab(),
        );
      case AppRoutes.signInPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => SignInPage(),
        );
      case AppRoutes.rootDoctor:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => RootDoctorPage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
