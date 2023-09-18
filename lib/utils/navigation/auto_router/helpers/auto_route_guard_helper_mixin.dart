import '../app_router.dart';

mixin AutoRouteGuardHelperMixin {
  List<String> get guardlessRoutes {
    return [SplashRoute.name, OnboardRoute.name, LoginRoute.name];
  }

  bool isGuardlessRoute(String routeName) => guardlessRoutes.contains(routeName);
}
