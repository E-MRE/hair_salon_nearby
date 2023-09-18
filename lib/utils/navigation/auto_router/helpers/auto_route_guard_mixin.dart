import 'package:auto_route/auto_route.dart';

import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../enum/auth_type.dart';
import '../app_router.dart';

mixin AuthRouteGuardMixin implements AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isGuardlessRoute(resolver.routeName)) {
      resolver.next();
      return;
    }

    final authExpired = !kTokenContext.isTokenAvailable() && !kTokenContext.isRefreshTokenAvailable();

    if (authExpired) {
      resolver.redirect(LoginRoute(authType: AuthType.user, onAuthResult: (isSuccess) => resolver.next(isSuccess)));
    } else {
      resolver.next();
    }
  }

  List<String> get guardlessRoutes {
    return [SplashRoute.name, OnboardRoute.name, LoginRoute.name, RegisterRoute.name];
  }

  bool isGuardlessRoute(String routeName) => guardlessRoutes.contains(routeName);
}
