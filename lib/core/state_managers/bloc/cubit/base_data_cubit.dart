import '../../../services/models/api_response.dart';
import '../../../services/models/entity_model.dart';
import '../../../utils/enums/special_key.dart';
import '../../../utils/enums/state_status.dart';
import '../../../utils/results/data_result.dart';
import '../states/base_data_state.dart';
import 'base_cubit.dart';

typedef ValidateDataResult<TData> = DataResult<TData> Function<TData>(DataResult<TData> dataResult);
typedef SetStateByDataResult<TData> = BaseDataState<TData> Function<TData>(DataResult<TData> dataResult);

typedef ValidateApiResponse<TReturn, TData> = ApiResponse<TReturn> Function<TReturn, TData extends EntityModel<TData>>(
    ApiResponse<TReturn> apiResponse);

typedef SetStateByApiResponse<TReturn, TData> = BaseDataState<TReturn>
    Function<TReturn, TData extends EntityModel<TData>>(ApiResponse<TReturn> apiResponse);

class BaseDataCubit<State extends BaseDataState> extends BaseCubit<State> {
  BaseDataCubit(super.initialState);

  ///Use it if your feature operation returns any data.
  ///It sets LoadingStatus before future operation and after the response updates state.
  ///
  ///Hierarchy: set [LoadingState] --> wait [futureResultCallback] -->  check [onCustomValidateCallback] --> update state with [DataResult]
  ///
  ///If operation throws any exception you can manage easily using [onExceptionCallback] property.
  ///
  ///Also you can use [onCustomSetStateCallback] property. It allows custom update state with [DataResult]
  ///
  ///Generics:
  ///
  ///TData --> It's your response data. For example [``int``, ``bool`` `List<User>`, ``Personal``]
  ///
  ///
  ///Example usage:
  ///
  ///```dart
  ///Future<void> getUserById(int id) async {
  ///   await sendForDataAsync<User>(futureDataResultCallback: () async => _repository.getUser(id),
  ///   onExceptionCallback:(exception) => _displayErrorMessage(exception.toString()),
  ///   );
  ///}
  ///```
  Future<void> sendRequestDataResult<TData>({
    ///For future operations
    required Future<DataResult<TData>> futureDataResult,

    ///if your state's status depends to other variables call this function
    ValidateDataResult<TData>? onCustomValidateCallback,

    ///use it if you want to update state for special scenarios
    SetStateByDataResult<TData>? onCustomSetStateCallback,

    ///manage errors if operation throws any exception
    ExceptionVoidCallback? onExceptionCallback,
  }) async {
    try {
      setStatus(StateStatus.loading);
      final dataResult = await futureDataResult;

      final result = onCustomValidateCallback?.call<TData>(dataResult) ?? dataResult;

      safeEmit((onCustomSetStateCallback?.call<TData>(result) ??
          state.copyWith(
            data: result.data,
            status: result.success.toStateStatus(),
            errorMessage: result.success ? SpecialKey.empty.value : result.message,
            infoMessage: result.success ? result.message : SpecialKey.empty.value,
          )) as State);
    } catch (exception) {
      _setExceptionState(onExceptionCallback, exception);
    }
  }

  Future<void> sendRequestApiResponse<TReturn, TParse extends EntityModel<TParse>>({
    ///For future operations
    required Future<ApiResponse<TReturn>> futureApiResponse,

    ///if your state's status depends to other variables call this function
    ValidateApiResponse<TReturn, TParse>? onCustomValidateCallback,

    ///use it if you want to update state for special scenarios
    SetStateByApiResponse<TReturn, TParse>? onCustomSetStateCallback,

    ///manage errors if operation throws any exception
    ExceptionVoidCallback? onExceptionCallback,
  }) async {
    try {
      setStatus(StateStatus.loading);
      final futureResult = await futureApiResponse;

      final result = onCustomValidateCallback?.call<TReturn, TParse>(futureResult) ?? futureResult;

      safeEmit((onCustomSetStateCallback?.call<TReturn, TParse>(result) ??
          state.copyWith(
            data: futureResult.data,
            status: futureResult.success.toStateStatus(),
            errorMessage: futureResult.success ? SpecialKey.empty.value : futureResult.message,
            infoMessage: futureResult.success ? futureResult.message : SpecialKey.empty.value,
          )) as State);
    } catch (exception) {
      _setExceptionState(onExceptionCallback, exception);
    }
  }

  void _setExceptionState(ExceptionVoidCallback? onExceptionCallback, Object exception) {
    if (onExceptionCallback != null) {
      onExceptionCallback.call(exception);
      return;
    }

    safeEmit(state.copyWith(
      status: StateStatus.error,
      isSetPreviousData: false,
      errorMessage: exception.toString(),
      infoMessage: SpecialKey.empty.value,
    ) as State);
  }
}
