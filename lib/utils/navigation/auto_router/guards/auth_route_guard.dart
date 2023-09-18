import 'package:auto_route/auto_route.dart';

import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../app_router.dart';
import '../helpers/auto_route_guard_helper_mixin.dart';

class AuthRouteGuard extends AutoRouteGuard with AutoRouteGuardHelperMixin {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isGuardlessRoute(resolver.routeName)) {
      resolver.next();
      return;
    }

    final authExpired = !kTokenContext.isTokenAvailable() && !kTokenContext.isRefreshTokenAvailable();

    if (authExpired) {
      resolver.redirect(const SplashRoute());
    } else {
      resolver.next();
    }
  }
}
