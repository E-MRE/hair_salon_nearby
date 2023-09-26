import '../../../../core/state_managers/bloc/states/base_state.dart';
import '../../../../core/utils/enums/state_status.dart';

class SplashState extends BaseState {
  SplashState.initial() : super.initial();

  SplashState({required super.errorMessage, required super.infoMessage, required super.status});

  @override
  SplashState copyWith({StateStatus? status, String? errorMessage, String? infoMessage}) {
    return SplashState(
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      status: status ?? this.status,
    );
  }
}
