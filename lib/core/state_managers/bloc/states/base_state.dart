import '../../../utils/enums/special_key.dart';
import '../../../utils/enums/state_status.dart';

abstract class BaseState {
  final StateStatus status;
  final String errorMessage;
  final String infoMessage;

  const BaseState({
    required this.status,
    required this.errorMessage,
    required this.infoMessage,
  });

  bool get isSuccess => status == StateStatus.success;

  BaseState.initial()
      : status = StateStatus.initial,
        errorMessage = SpecialKey.empty.value,
        infoMessage = SpecialKey.empty.value;

  BaseState.loading({this.infoMessage = '', this.errorMessage = ''}) : status = StateStatus.loading;

  BaseState.error({required this.errorMessage})
      : status = StateStatus.error,
        infoMessage = '';

  BaseState.success({this.infoMessage = ''})
      : status = StateStatus.success,
        errorMessage = '';

  BaseState copyWith({StateStatus? status, String? errorMessage, String? infoMessage});
}
