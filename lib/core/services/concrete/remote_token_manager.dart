import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/helpers/token/token_context.dart';
import '../abstract/cache_service.dart';
import '../abstract/token_service.dart';

class RemoteTokenManager extends TokenService {
  @override
  final CacheService cacheService;

  @override
  final TokenContext tokenContext;

  RemoteTokenManager({CacheService? cacheService, TokenContext? tokenContext})
      : cacheService = cacheService ?? kCacheService,
        tokenContext = tokenContext ?? kTokenContext;
}
