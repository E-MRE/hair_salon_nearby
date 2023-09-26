import '../../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../../core/utils/helpers/token/token_context.dart';
import '../../../../core/utils/helpers/token/token_context_helper_mixin.dart';
import '../../../../models/request/login_request_model.dart';
import '../../../../repositories/abstracts/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> with TokenContextHelperMixin {
  LoginCubit({LoginRepository? loginRepository, TokenContext? tokenContext})
      : _loginRepository = loginRepository ?? CoreDependencies.getDependency<LoginRepository>(),
        _tokenContext = tokenContext ?? kTokenContext,
        super(LoginState.initial());

  final LoginRepository _loginRepository;
  final TokenContext _tokenContext;

  Future login(String email, String password) async {
    safeEmit(state.copyWith(status: StateStatus.loading));

    final response = await _loginRepository.login(LoginRequestModel(email: email, password: password));

    if (response.isNotSuccessOrDataNotExists) {
      safeEmit(state.copyWith(status: StateStatus.error, errorMessage: response.message));
      return;
    }

    saveByTokenModel(_tokenContext, response.data!);
    safeEmit(state.copyWith(authModel: response.data, status: StateStatus.success));
  }
}
