import '../../core/utils/constants/core_app_constants.dart';
import '../../core/utils/helpers/dependency/dependency_injector.dart';
import '../../repositories/abstracts/login_repository.dart';
import '../../repositories/abstracts/public_repository.dart';
import '../../repositories/concretes/dio_login_repository.dart';
import '../../repositories/concretes/dio_public_repository.dart';
import '../../repositories/mocks/mock_login_repository.dart';
import '../../repositories/mocks/mock_public_repository.dart';

mixin CustomDependencyInjectionMixin {
  void registerDependencies(DependencyInjector injector) {
    if (kEnvironment.isTest) {
      //Repositories
      injector.registerFactory<PublicRepository>(() => MockPublicRepository());
      injector.registerFactory<LoginRepository>(() => MockLoginRepository());
    } else {
      //Repositories
      injector.registerFactory<PublicRepository>(() => DioPublicRepository.defaultRemote());
      injector.registerFactory<LoginRepository>(() => DioLoginRepository.defaultRemote());
    }
  }
}
