import 'package:hair_salon_nearby/core/state_managers/bloc/states/base_state.dart';
import 'package:hair_salon_nearby/core/utils/enums/state_status.dart';

class RegisterState extends BaseState {
  const RegisterState({required super.status, required super.errorMessage, required super.infoMessage});
  RegisterState.initial() : super.initial();
  RegisterState.loading() : super.loading();
  RegisterState.error({required super.errorMessage}) : super.error();
  RegisterState.success() : super.success();

  @override
  RegisterState copyWith({StateStatus? status, String? errorMessage, String? infoMessage}) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
    );
  }
}
