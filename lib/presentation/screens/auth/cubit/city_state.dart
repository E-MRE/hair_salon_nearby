import 'package:hair_salon_nearby/core/state_managers/bloc/states/base_data_state.dart';
import 'package:hair_salon_nearby/core/utils/enums/state_status.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/models/entity/county_model.dart';

final class CityState extends BaseDataState<List<CityModel>> {
  final CityModel? selectedCity;
  final CountyModel? selectedCounty;

  CityState({
    List<CityModel>? data,
    this.selectedCity,
    this.selectedCounty,
    required super.status,
    String errorMessage = '',
    String infoMessage = '',
  }) : super(data: data, errorMessage: errorMessage, infoMessage: infoMessage);

  CityState.initial()
      : selectedCity = null,
        selectedCounty = null,
        super.initial();

  CityState.loading()
      : selectedCity = null,
        selectedCounty = null,
        super.loading();

  @override
  CityState copyWith({
    bool isSetPreviousData = true,
    CityModel? selectedCity,
    CountyModel? selectedCounty,
    List<CityModel>? data,
    StateStatus? status,
    String? errorMessage,
    String? infoMessage,
  }) {
    return CityState(
      data: data ?? this.data,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedCounty: selectedCity != null ? null : selectedCounty ?? this.selectedCounty,
    );
  }
}
