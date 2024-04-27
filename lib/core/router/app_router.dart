import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:med_card/lib/root_page/root_page.dart';
import 'package:med_card/lib/root_page/tabs/home_tab/home_tab.dart';
import 'package:med_card/lib/root_page/tabs/profile_tab/profile_tab.dart';
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
          path: AppRoutes.rootPage,
          builder: (BuildContext context, GoRouterState state) {
            return const RootPage();
          },
        ),
        GoRoute(
          path: AppRoutes.profileTab,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileTab();
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