import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio/dio_city_repository.dart';
import 'package:hair_salon_nearby/repositories/mocks/mock_city_repository.dart';
import 'package:hair_salon_nearby/utils/helpers/device/device_info.dart';

import '../../core/utils/constants/core_app_constants.dart';
import '../../core/utils/helpers/dependency/dependency_injector.dart';
import '../../repositories/abstracts/login_repository.dart';
import '../../repositories/abstracts/public_repository.dart';
import '../../repositories/concretes/dio/dio_login_repository.dart';
import '../../repositories/concretes/dio/dio_public_repository.dart';
import '../../repositories/mocks/mock_login_repository.dart';
import '../../repositories/mocks/mock_public_repository.dart';

mixin CustomDependencyInjectionMixin {
  void registerDependencies(DependencyInjector injector) {
    if (CoreAppConstants.isTest) {
      //Repositories
      injector.registerFactory<PublicRepository>(() => MockPublicRepository());
      injector.registerFactory<LoginRepository>(() => MockLoginRepository());
      injector.registerFactory<CityRepository>(() => MockCityRepository());

      //Helpers
      injector.registerLazySingleton<DeviceInfo>(() => DeviceInfo.test());
    } else {
      //Repositories
      injector.registerFactory<PublicRepository>(() => DioPublicRepository(dataService: kRemoteDataService));
      injector.registerFactory<LoginRepository>(() => DioLoginRepository.defaultRemote());
      injector.registerFactory<CityRepository>(() => DioCityRepository(dataService: kRemoteDataService));

      //Helpers
      injector.registerLazySingleton<DeviceInfo>(() => DeviceInfo());
    }

    //state managers
    injector.registerFactory<SplashCubit>(
      () => SplashCubit(publicRepository: injector.get<PublicRepository>()),
    );
  }
}
