import 'package:hair_salon_nearby/core/services/abstract/cache_service.dart';
import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/models/entity/auth_model.dart';
import 'package:hair_salon_nearby/utils/enum/auth_type.dart';
import 'package:hair_salon_nearby/utils/helpers/caching_keys.dart';

import '../../../../core/services/abstract/token_service.dart';
import '../../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../core/utils/helpers/token/token_context.dart';
import '../../../../models/request/login_request_model.dart';
import '../../../../repositories/abstracts/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit({
    required LoginRepository loginRepository,
    required TokenContext tokenContext,
    required TokenService tokenService,
    required CacheService cacheService,
  })  : _loginRepository = loginRepository,
        _tokenContext = tokenContext,
        _cacheService = cacheService,
        _tokenService = tokenService,
        super(LoginState.initial());

  final LoginRepository _loginRepository;
  final TokenContext _tokenContext;
  final TokenService _tokenService;
  final CacheService _cacheService;

  Future<void> login(String email, String password) async {
    await _authAsync(
      futureAuth: () => _loginRepository.login(LoginRequestModel(email: email, password: password)),
      authType: AuthType.emailPassword,
    );
  }

  Future<void> guestLogin() async {
    await _authAsync(futureAuth: _loginRepository.guestLogin, authType: AuthType.guest);
  }

  Future<void> _authAsync({
    required Future<ApiResponse<AuthModel>> Function() futureAuth,
    required AuthType authType,
  }) async {
    safeEmit(state.copyWith(status: StateStatus.loading, authLoading: authType));

    final response = await futureAuth();

    if (response.isNotSuccessOrDataNotExists) {
      safeEmit(state.copyWith(status: StateStatus.error, errorMessage: response.message));
      return;
    }

    _saveToCache(response.data!, authType);
    safeEmit(state.copyWith(authModel: response.data, status: StateStatus.success));
  }

  void _saveToCache(AuthModel authModel, AuthType authType) {
    _tokenService.saveTokenToCache(authModel);
    _tokenService.saveByTokenModel(_tokenContext, authModel);
    _cacheService.setValue<AuthType>(CachingKeys.authType, authType);
  }
}
