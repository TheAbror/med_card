import 'package:flutter/material.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/core/router/cupertino_style_navigation_route.dart';
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

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
