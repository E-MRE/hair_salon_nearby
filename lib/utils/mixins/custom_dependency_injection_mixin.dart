import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/login_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/register_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/menu/cubit/menu_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:hair_salon_nearby/repositories/abstracts/cache_city_repository.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';
import 'package:hair_salon_nearby/repositories/abstracts/register_repository.dart';
import 'package:hair_salon_nearby/repositories/abstracts/venue_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/cache/hive/hive_city_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio/dio_city_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio/dio_register_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio/dio_venue_repository.dart';
import 'package:hair_salon_nearby/repositories/mocks/mock_city_repository.dart';
import 'package:hair_salon_nearby/repositories/mocks/mock_register_repository.dart';
import 'package:hair_salon_nearby/repositories/mocks/mock_venue_repository.dart';
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
      injector.registerFactory<RegisterRepository>(() => MockRegisterRepository());
      injector.registerFactory<CityRepository>(() => MockCityRepository());
      injector.registerFactory<VenueRepository>(() => MockVenueRepository());

      //Helpers
      injector.registerLazySingleton<DeviceInfo>(() => DeviceInfo.test());
    } else {
      //Repositories
      injector.registerFactory<PublicRepository>(() => DioPublicRepository(dataService: kRemoteDataService));
      injector.registerFactory<LoginRepository>(() => DioLoginRepository(dataService: kRemoteDataService));
      injector.registerFactory<RegisterRepository>(() => DioRegisterRepository(dataService: kRemoteDataService));
      injector.registerFactory<CityRepository>(() => DioCityRepository(dataService: kRemoteDataService));
      injector.registerFactory<CacheCityRepository>(() => HiveCityRepository(cacheService: kCacheService));
      injector.registerFactory<VenueRepository>(() => DioVenueRepository(dataService: kRemoteDataService));

      //Helpers
      injector.registerLazySingleton<DeviceInfo>(() => DeviceInfo());
    }

    //state managers
    injector.registerFactory<SplashCubit>(
      () => SplashCubit(publicRepository: injector.get<PublicRepository>()),
    );

    injector.registerFactory<CityCubit>(
      () => CityCubit(
        cityRepository: injector.get<CityRepository>(),
        cacheService: kCacheService,
        cacheCityRepository: injector.get<CacheCityRepository>(),
      ),
    );

    injector.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerRepository: injector.get<RegisterRepository>()),
    );

    injector.registerFactory<LoginCubit>(
      () => LoginCubit(
        loginRepository: injector.get<LoginRepository>(),
        cacheService: kCacheService,
        tokenContext: kTokenContext,
        tokenService: kTokenService,
      ),
    );

    injector.registerFactory<MenuCubit>(() => MenuCubit(venueRepository: injector.get<VenueRepository>()));
  }
}
