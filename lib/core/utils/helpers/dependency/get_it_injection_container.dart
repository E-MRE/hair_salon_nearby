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

    customInjections?.call(injector);
  }
}
