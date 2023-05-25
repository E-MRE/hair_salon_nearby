import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/enums/special_key.dart';
import '../../../utils/enums/state_status.dart';
import '../../../utils/mixins/update_view_mixin.dart';
import '../../../utils/results/result.dart';
import '../states/base_state.dart';

typedef ExceptionVoidCallback = void Function(Object exception);
typedef SetStateByResult = BaseState Function(Result result);

///Manage simple states with this Cubit. This cubit needed State inherited to BaseState.
///BaseState includes state status and error message. Which mean if you have a state without data, this cubit best option.
abstract class BaseCubit<State extends BaseState> extends Cubit<State> with UpdateViewMixin<State> {
  BaseCubit(super.initialState);

  ///Change state's status safety way.
  void setStatus(StateStatus stateStatus) {
    safeEmit(state.copyWith(status: stateStatus) as State);
  }

  ///Use it for simple Future operations. It sets LoadingStatus before future operation and after the response updates state.
  ///
  ///Hierarchy: set [LoadingState] --> wait [futureResultCallback] --> update state with [Result]
  ///
  ///If operation throws any exception you can manage easily using [onExceptionCallback] property.
  ///
  ///
  ///Example usage:
  ///
  ///```dart
  ///Future<void> addUser(User user) async {
  ///   await sendAsync<User>(futureResultCallback: () async => _repository.add(user),
  ///   onExceptionCallback:(exception) => _displayErrorMessage(exception.toString()),
  ///   );
  ///}
  ///```
  Future<void> sendRequestResult({
    ///For future operations
    required Future<Result> futureResultCallback,
    SetStateByResult? setStateByResult,

    ///manage errors if operation throws any exception
    ExceptionVoidCallback? onExceptionCallback,
  }) async {
    try {
      setStatus(StateStatus.loading);
      final futureResult = await futureResultCallback;

      safeEmit((setStateByResult?.call(futureResult) ??
          state.copyWith(
            status: futureResult.success.toStateStatus(),
            errorMessage: futureResult.success ? SpecialKey.empty.value : futureResult.message,
            infoMessage: futureResult.success ? futureResult.message : SpecialKey.empty.value,
          )) as State);
    } catch (exception) {
      if (onExceptionCallback != null) {
        onExceptionCallback.call(exception);
        return;
      }

      safeEmit(state.copyWith(
        status: StateStatus.error,
        errorMessage: exception.toString(),
        infoMessage: SpecialKey.empty.value,
      ) as State);
    }
  }
}
