import 'package:hair_salon_nearby/core/services/abstract/cache_service.dart';
import 'package:hair_salon_nearby/core/state_managers/bloc/cubit/base_data_cubit.dart';
import 'package:hair_salon_nearby/core/utils/enums/state_status.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/models/entity/county_model.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_state.dart';
import 'package:hair_salon_nearby/repositories/abstracts/cache_city_repository.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';
import 'package:hair_salon_nearby/utils/extensions/status_extensions.dart';
import 'package:hair_salon_nearby/utils/helpers/caching_keys.dart';

final class CityCubit extends BaseDataCubit<CityState> {
  CityCubit({required this.cacheService, required this.cityRepository, required this.cacheCityRepository})
      : super(CityState.initial());

  final CityRepository cityRepository;
  final CacheCityRepository cacheCityRepository;
  final CacheService cacheService;

  Future<void> getCities() async {
    safeEmit(CityState.loading());

    final cacheResult = await cacheCityRepository.getCities();
    if (cacheResult.isSuccessAndDataExists) {
      safeEmit(
        CityState(
          data: cacheResult.data,
          status: cacheResult.success.toStateStatus(),
          errorMessage: cacheResult.success ? '' : cacheResult.message,
          infoMessage: cacheResult.success ? cacheResult.message : '',
        ),
      );
    } else {
      final result = await cityRepository.getCities();

      final status = result.processStatus?.toStateStatus() ?? StateStatus.error;
      _saveCitiesOnLocalByStatus(status, result.data);

      safeEmit(CityState(
        status: status,
        data: result.data,
        errorMessage: status == StateStatus.success ? '' : result.friendlyMessage?.message ?? result.message,
        infoMessage: status == StateStatus.success ? result.friendlyMessage?.message ?? result.message : '',
      ));
    }
  }

  void setCity(CityModel? cityModel) {
    if (cityModel == null) return;
    safeEmit(state.copyWith(selectedCity: cityModel));
  }

  void setCounty(CountyModel? countyModel) {
    safeEmit(state.copyWith(selectedCounty: countyModel));
  }

  void _saveCitiesOnLocalByStatus(StateStatus status, List<CityModel>? data) {
    if (data == null || status != StateStatus.success) return;

    cacheService.setValue<List<CityModel>>(CachingKeys.cities, data);
  }
}
