import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';

import '../../../../core/state_managers/bloc/states/base_state.dart';
import '../../../../core/utils/enums/state_status.dart';

class SplashState extends BaseState {
  final ProcessStatus processStatus;
  SplashState.initial({this.processStatus = ProcessStatus.undefined}) : super.initial();

  SplashState({
    required super.errorMessage,
    required super.infoMessage,
    required super.status,
    required this.processStatus,
  });

  @override
  SplashState copyWith({StateStatus? status, String? errorMessage, String? infoMessage, ProcessStatus? processStatus}) {
    return SplashState(
      processStatus: processStatus ?? this.processStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      status: status ?? this.status,
    );
  }
}
