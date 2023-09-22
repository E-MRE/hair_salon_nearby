import 'package:auto_route/auto_route.dart';

import '../../../../core/services/abstract/cache_service.dart';
import '../../../../core/utils/enums/caching_keys.dart';
import '../../../../core/utils/helpers/token/token_context.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';

class SplashViewModel {
  final TokenContext tokenContext;
  final CacheService cacheService;

  SplashViewModel({required this.tokenContext, required this.cacheService});

  Future<PageRouteInfo> getRouteInfo() async {
    final onboardRequired = await cacheService.getValue<bool>(CachingKeys.onboarding);
    if (onboardRequired ?? true) {
      return const OnboardRoute();
    }

    final isAnyTokenAvailable = tokenContext.isTokenAvailable() || tokenContext.isRefreshTokenAvailable();

    if (isAnyTokenAvailable) {
      return const MenuRoute();
    }

    return LoginRoute();
  }
}
