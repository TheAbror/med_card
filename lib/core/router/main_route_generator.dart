import 'package:flutter/material.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/core/router/cupertino_style_navigation_route.dart';
import 'package:med_card/lib/doc_root_page/doc_root_page.dart';
import 'package:med_card/lib/doc_root_page/tabs/doc_appointment_tab/accept_patient.dart';
import 'package:med_card/lib/doc_root_page/tabs/doc_appointment_tab/doc_appointment_tab.dart';
import 'package:med_card/lib/doc_root_page/tabs/doc_appointment_tab/patient_details_page.dart';
import 'package:med_card/lib/doc_root_page/tabs/doc_appointment_tab/recording_page.dart';
import 'package:med_card/lib/gov_auth_page/face_identification_page.dart';
import 'package:med_card/lib/gov_auth_page/gov_auth_page.dart';
import 'package:med_card/lib/root_patient_page/pages/appointment_page/appointment_page.dart';
import 'package:med_card/lib/root_patient_page/pages/signin_page/signin_page.dart';
import 'package:med_card/lib/root_patient_page/root_patient_page.dart';
import 'package:med_card/lib/root_patient_page/tabs/home_tab/all_specialties.dart';
import 'package:med_card/lib/root_patient_page/tabs/home_tab/home_tab.dart';
import 'package:med_card/lib/splash_page/splash_page.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
      case AppRoutes.rootPatient:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RootPatientPage(),
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
      case AppRoutes.docRoot:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => DocRootPage(),
        );
      case AppRoutes.allSpecialties:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => AllSpecialties(),
        );
      case AppRoutes.govAuthPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => GovAuthPage(),
        );
      case AppRoutes.faceIdentificationPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => FaceIdentificationPage(),
        );
      case AppRoutes.patientdetailsPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => PatientDetailsPage(
            info: settings.arguments as PatientInfoWhenAccept,
          ),
        );
      case AppRoutes.acceptPatientPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => AcceptPatientPage(
            info: settings.arguments as PatientInfoWhenAccept,
          ),
        );
      case AppRoutes.recordVoice:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => VoiceRecordingPage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
