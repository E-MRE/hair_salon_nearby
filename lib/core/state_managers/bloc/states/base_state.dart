import '../../../utils/enums/special_key.dart';
import '../../../utils/enums/state_status.dart';

abstract class BaseState {
  final StateStatus status;
  final String errorMessage;
  final String infoMessage;

  BaseState({
    required this.status,
    required this.errorMessage,
    required this.infoMessage,
  });

  BaseState.initial()
      : status = StateStatus.initial,
        errorMessage = SpecialKey.empty.value,
        infoMessage = SpecialKey.empty.value;

  BaseState copyWith({StateStatus? status, String? errorMessage, String? infoMessage});
}
