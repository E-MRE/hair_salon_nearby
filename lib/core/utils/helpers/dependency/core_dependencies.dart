import '../../../services/abstract/cache_service.dart';
import '../token/token_context.dart';
import 'get_it_injection_container.dart';

TokenContext get kTokenContext => GetItInjectionContainer.instance.injector.get<TokenContext>();
CacheService get kCacheService => GetItInjectionContainer.instance.injector.get<CacheService>();
