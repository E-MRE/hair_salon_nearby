import '../../../utils/enums/state_status.dart';
import 'base_state.dart';

abstract class BaseDataState<TData> extends BaseState {
  final TData? data;

  BaseDataState({
    required this.data,
    required super.status,
    required super.errorMessage,
    required super.infoMessage,
  }) : super();

  BaseDataState.initial({TData? data})
      : data = data,
        super.initial();

  BaseDataState.loading({TData? data})
      : this.data = data,
        super(status: StateStatus.loading, errorMessage: '', infoMessage: '');

  bool get isDataNull => data == null;

  @override
  BaseDataState copyWith({
    bool isSetPreviousData = true,
    TData? data,
    StateStatus? status,
    String? errorMessage,
    String? infoMessage,
  });
}
