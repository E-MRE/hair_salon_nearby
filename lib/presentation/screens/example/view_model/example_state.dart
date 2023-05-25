import '../../../../core/state_managers/bloc/states/base_data_state.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../models/entity/example_model.dart';

class ExampleState extends BaseDataState<List<ExampleModel>> {
  ExampleState({
    required super.data,
    required super.errorMessage,
    required super.infoMessage,
    required super.status,
  }) : super();

  ExampleState.initial() : super.initial();

  @override
  ExampleState copyWith({
    List<ExampleModel>? data,
    bool isSetPreviousData = true,
    String? errorMessage,
    String? infoMessage,
    StateStatus? status,
  }) {
    return ExampleState(
      data: data ?? (isSetPreviousData ? this.data : null),
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      status: status ?? this.status,
    );
  }
}
