import 'package:hair_salon_nearby/core/state_managers/bloc/states/base_data_state.dart';
import 'package:hair_salon_nearby/core/utils/enums/state_status.dart';
import 'package:hair_salon_nearby/models/entity/venue_list_model.dart';

final class MenuState extends BaseDataState<VenueListModel> {
  MenuState.initial() : super.initial();

  MenuState.loading() : super.loading();

  MenuState.success({super.data, required super.infoMessage}) : super(errorMessage: '', status: StateStatus.success);

  MenuState.error({required super.errorMessage}) : super(data: null, status: StateStatus.error, infoMessage: '');

  MenuState({super.data, required super.status, required super.errorMessage, required super.infoMessage});

  @override
  MenuState copyWith({
    bool isSetPreviousData = true,
    VenueListModel? data,
    StateStatus? status,
    String? errorMessage,
    String? infoMessage,
  }) {
    return MenuState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      data: data ?? this.data,
    );
  }
}
