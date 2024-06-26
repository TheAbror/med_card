import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:med_card/lib/root_patient_page/root_patient_page.dart';
import 'package:med_card/lib/root_patient_page/tabs/home_tab/home_tab.dart';
import 'package:med_card/lib/root_patient_page/tabs/med_card_tab/med_card_tab.dart';
import 'package:med_card/lib/splash_page/splash_page.dart';

import 'app_routes.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.rootPatient,
          builder: (BuildContext context, GoRouterState state) {
            return const RootPatientPage();
          },
        ),
        GoRoute(
          path: AppRoutes.medCard,
          builder: (BuildContext context, GoRouterState state) {
            return const MedCardTab();
          },
        ),
        GoRoute(
          path: AppRoutes.homeTab,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeTab();
          },
        ),
      ],
    ),
  ],
);
