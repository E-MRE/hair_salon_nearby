import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../presentation/screens/auth/view/login_page.dart';
import '../../../presentation/screens/auth/view/register_page.dart';
import '../../../presentation/screens/menu/view/menu_page.dart';
import '../../../presentation/screens/onboard/view/onboard_page.dart';
import '../../../presentation/screens/splash/view/splash_page.dart';
import '../../constants/router_name_constants.dart';
import '../../enum/auth_type.dart';
import 'helpers/auto_route_guard_mixin.dart';
import 'routers/fade_transition_route.dart';
import 'routers/scale_transition_route.dart';
import 'routers/slide_transition_route.dart';

part 'app_router.gr.dart';

// extend the generated private router
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter with AuthRouteGuardMixin implements AutoRouteGuard {
  List<AutoRoute> get routes => <AutoRoute>[
        FadeTransitionRoute(page: SplashRoute.page, initial: true, path: RouterPathConstants.splash),
        ScaleTransitionRoute(page: OnboardRoute.page, path: RouterPathConstants.onboard),
        FadeTransitionRoute(page: LoginRoute.page, path: RouterPathConstants.login),
        SlideTransitionRoute(page: RegisterRoute.page, path: RouterPathConstants.register),
        ScaleTransitionRoute(page: MenuRoute.page, path: RouterPathConstants.menu),
      ];
}
