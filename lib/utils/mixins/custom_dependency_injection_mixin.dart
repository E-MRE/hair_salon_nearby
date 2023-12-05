import 'package:hair_salon_nearby/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:hair_salon_nearby/utils/helpers/device/device_info.dart';

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
    if (CoreAppConstants.isTest) {
      //Repositories
      injector.registerFactory<PublicRepository>(() => MockPublicRepository());
      injector.registerFactory<LoginRepository>(() => MockLoginRepository());

      //Helpers
      injector.registerLazySingleton<DeviceInfo>(() => DeviceInfo.test());
    } else {
      //Repositories
      injector.registerFactory<PublicRepository>(() => DioPublicRepository.defaultRemote());
      injector.registerFactory<LoginRepository>(() => DioLoginRepository.defaultRemote());

      //Helpers
      injector.registerLazySingleton<DeviceInfo>(() => DeviceInfo());
    }

    //state managers
    injector.registerFactory<SplashCubit>(
      () => SplashCubit(publicRepository: injector.get<PublicRepository>()),
    );
  }
}
