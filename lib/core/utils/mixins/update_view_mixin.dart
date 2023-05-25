import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state_managers/bloc/states/base_state.dart';

mixin UpdateViewMixin<T extends BaseState> on Cubit<T> {
  void safeEmit(T newState) {
    if (isClosed) return;
    emit(newState);
  }
}
