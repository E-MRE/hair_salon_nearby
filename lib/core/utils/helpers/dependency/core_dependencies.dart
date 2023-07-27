import '../../../services/abstract/cache_service.dart';
import '../../../services/abstract/dio_remote_data_service.dart';
import '../../../services/abstract/token_service.dart';
import '../token/token_context.dart';
import 'get_it_injection_container.dart';

TokenService get kTokenService => GetItInjectionContainer.instance.injector.get<TokenService>();
TokenContext get kTokenContext => GetItInjectionContainer.instance.injector.get<TokenContext>();
CacheService get kCacheService => GetItInjectionContainer.instance.injector.get<CacheService>();
DioRemoteDataService get kRemoteDataService => GetItInjectionContainer.instance.injector.get<DioRemoteDataService>();
