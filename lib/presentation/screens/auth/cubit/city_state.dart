import 'package:hair_salon_nearby/core/state_managers/bloc/states/base_data_state.dart';
import 'package:hair_salon_nearby/core/utils/enums/state_status.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';

final class CityState extends BaseDataState<List<CityModel>> {
  CityState({
    List<CityModel>? data,
    required super.status,
    String errorMessage = '',
    String infoMessage = '',
  }) : super(data: data, errorMessage: errorMessage, infoMessage: infoMessage);

  CityState.initial() : super.initial();

  CityState.loading() : super.loading();

  @override
  CityState copyWith({
    bool isSetPreviousData = true,
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
    );
  }
}
