import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/helpers/token/token_context.dart';
import '../abstract/cache_service.dart';
import '../abstract/token_service.dart';

class DioTokenManager extends TokenService {
  final CacheService _cacheService;

  @override
  CacheService get cacheService => _cacheService;

  @override
  final TokenContext tokenContext;

  DioTokenManager({CacheService? cacheService, TokenContext? tokenContext})
      : _cacheService = cacheService ?? kCacheService,
        tokenContext = tokenContext ?? kTokenContext;
}
