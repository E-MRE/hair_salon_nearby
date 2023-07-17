import '../token/api_token_controller.dart';
import '../token/token_controller.dart';

import 'dependency_service.dart';
import 'package:get_it/get_it.dart';

class CoreDependencyManager implements DependencyService {
  const CoreDependencyManager._private();

  static final GetIt _dependencyInjector = GetIt.instance;

  @override
  void register() {
    _dependencyInjector.registerLazySingleton<TokenController>(() => ApiTokenController());
  }

  static TokenController get tokenController => _dependencyInjector.get<TokenController>();
}
