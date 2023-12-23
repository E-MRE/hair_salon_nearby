import 'package:hair_salon_nearby/utils/enum/auth_type.dart';

import '../../../../core/state_managers/bloc/states/base_state.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../models/entity/auth_model.dart';

class LoginState extends BaseState {
  LoginState({
    required super.status,
    required super.errorMessage,
    required super.infoMessage,
    this.authModel,
    this.authLoading,
  });

  LoginState.initial({this.authModel, this.authLoading}) : super.initial();

  final AuthModel? authModel;

  final AuthType? authLoading;

  @override
  LoginState copyWith({
    StateStatus? status,
    String? errorMessage,
    String? infoMessage,
    AuthModel? authModel,
    AuthType? authLoading,
  }) {
    return LoginState(
      status: status ?? this.status,
      authModel: authModel ?? this.authModel,
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      authLoading: authLoading ?? this.authLoading,
    );
  }
}
