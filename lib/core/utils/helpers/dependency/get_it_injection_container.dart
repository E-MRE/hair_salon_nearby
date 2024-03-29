import '../../../services/abstract/cache_service.dart';
import '../../../services/abstract/dio_remote_data_service.dart';
import '../../../services/abstract/token_service.dart';
import '../../../services/concrete/dio_remote_data_manager.dart';
import '../../../services/concrete/dio_token_manager.dart';
import '../../../services/concrete/hive_cache_manager.dart';
import '../token/api_token_context.dart';
import '../token/token_context.dart';
import 'get_it_dependency_injector.dart';
import 'injection_container.dart';

class GetItInjectionContainer extends InjectionContainer {
  static GetItInjectionContainer? _instance;
  static GetItInjectionContainer get instance {
    _instance ??= GetItInjectionContainer._private();
    return _instance!;
  }

  GetItInjectionContainer._private() : super(injector: GetItDependencyInjector());

  @override
  void register({RegisterDependenciesFunction? customInjections}) {
    if (!injector.isRegistered<TokenContext>()) {
      injector.registerLazySingleton<TokenContext>(() => ApiTokenContext());
    }

    if (!injector.isRegistered<CacheService>()) {
      injector.registerLazySingleton<CacheService>(() => HiveCacheManager());
    }

    if (!injector.isRegistered<DioRemoteDataService>()) {
      injector.registerLazySingleton<DioRemoteDataService>(() => DioRemoteDataManager.byDefault());
    }

    if (!injector.isRegistered<TokenService>()) {
      injector.registerLazySingleton<TokenService>(() => DioTokenManager());
    }

    customInjections?.call(injector);
  }
}
