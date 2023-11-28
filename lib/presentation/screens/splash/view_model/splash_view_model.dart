import 'package:auto_route/auto_route.dart';

import '../../../../core/services/abstract/cache_service.dart';
import '../../../../core/utils/helpers/token/token_context.dart';
import '../../../../utils/helpers/caching_keys.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';

class SplashViewModel {
  final TokenContext tokenContext;
  final CacheService cacheService;

  SplashViewModel({required this.tokenContext, required this.cacheService});

  Future<PageRouteInfo> getRouteInfo() async {
    final result = cacheService.getValue<bool>(CachingKeys.onboarding, defaultValue: true);
    if (result.data ?? true) {
      return const OnboardRoute();
    }

    final isAnyTokenAvailable = tokenContext.isTokenAvailable() || tokenContext.isRefreshTokenAvailable();

    if (isAnyTokenAvailable) {
      return const MenuRoute();
    }

    return LoginRoute();
  }
}
