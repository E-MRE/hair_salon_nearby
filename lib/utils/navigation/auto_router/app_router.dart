import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../presentation/screens/auth/view/login_page.dart';
import '../../../presentation/screens/auth/view/register_page.dart';
import '../../../presentation/screens/menu/view/menu_page.dart';
import '../../../presentation/screens/onboard/view/onboard_page.dart';
import '../../../presentation/screens/splash/view/splash_page.dart';
import '../../constants/router_name_constants.dart';
import '../../enum/auth_type.dart';
import 'helpers/auto_route_by_auth_guard.dart';

part 'app_router.gr.dart';

// extend the generated private router
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: RouterPathConstants.splash,
        ),
        AutoRoute(page: OnboardRoute.page, path: RouterPathConstants.onboard),
        AutoRoute(page: LoginRoute.page, path: RouterPathConstants.login),
        AutoRoute(page: RegisterRoute.page, path: RouterPathConstants.register),
        AutoRouteByAuthGuard(page: MenuRoute.page, path: RouterPathConstants.menu),
      ];
}
