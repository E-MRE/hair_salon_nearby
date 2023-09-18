import 'package:auto_route/auto_route.dart';

import '../guards/auth_route_guard.dart';

class AutoRouteByAuthGuard extends AutoRoute {
  factory AutoRouteByAuthGuard({required PageInfo page, required String path, List<AutoRouteGuard> guards = const []}) {
    return AutoRouteByAuthGuard(page: page, path: path, guards: [AuthRouteGuard(), ...guards]);
  }
}
