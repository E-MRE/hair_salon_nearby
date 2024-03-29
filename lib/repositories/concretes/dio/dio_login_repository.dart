import 'package:hair_salon_nearby/core/services/models/empty_api_request_model.dart';

import '../../../core/repositories/base_remote_repository.dart';
import '../../../core/services/models/api_response.dart';
import '../../../core/services/models/refresh_token_request_model.dart';
import '../../../core/services/models/token_model.dart';
import '../../../models/entity/auth_model.dart';
import '../../../models/request/login_request_model.dart';
import '../../../utils/constants/endpoints/endpoint_constants.dart';
import '../../abstracts/login_repository.dart';

class DioLoginRepository extends BaseRemoteRepository implements LoginRepository {
  DioLoginRepository({required super.dataService}) : super.remote();
  DioLoginRepository.defaultRemote() : super.defaultRemote();

  @override
  Future<ApiResponse<AuthModel>> login(LoginRequestModel request) async {
    return await dataService.postData<AuthModel>(
      endpoint: EndpointConstants.login.login,
      fromMap: (json) => AuthModel.fromJson(json),
      request: request,
    );
  }

  @override
  Future<ApiResponse<AuthModel>> guestLogin() {
    return dataService.postData<AuthModel>(
      endpoint: EndpointConstants.login.guestLogin,
      fromMap: (json) => AuthModel.fromJson(json),
      request: EmptyApiRequestModel(),
    );
  }

  @override
  Future<ApiResponse<TokenModel>> refreshToken(RefreshTokenRequestModel request) async {
    return await dataService.postData(
      endpoint: EndpointConstants.login.refreshToken,
      fromMap: (json) => TokenModel.fromJson(json),
      request: request,
    );
  }

  @override
  Future<ApiResponse<TokenModel>> guestRefreshToken(RefreshTokenRequestModel request) {
    return dataService.postData(
      endpoint: EndpointConstants.login.guestRefreshToken,
      fromMap: (json) => TokenModel.fromJson(json),
      request: request,
    );
  }
}
