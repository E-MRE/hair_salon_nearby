import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hair_salon_nearby/utils/constants/endpoints/endpoint_constants.dart';

import '../../utils/enums/special_key.dart';
import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/helpers/token/token_context.dart';
import '../abstract/token_service.dart';
import '../models/refresh_token_expire_dio_error.dart';

class TokenExpirationInterceptor<TRemote> extends Interceptor {
  final TokenService _tokenService;
  final TokenContext _tokenContext;
  final List<String> _unAuthorizedAcceptances;

  TokenExpirationInterceptor({TokenService? tokenService, TokenContext? tokenContext})
      : _tokenService = tokenService ?? kTokenService,
        _tokenContext = tokenContext ?? kTokenContext,
        _unAuthorizedAcceptances = [
          EndpointConstants.public.checkUpdate.toLowerCase(),
          EndpointConstants.login.refreshToken.toLowerCase(),
          EndpointConstants.login.login.toLowerCase(),
        ];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool isTokenRequest = options.path.toLowerCase() == _tokenService.refreshTokenEndpoint.toLowerCase();
    bool isNotExistsAuthorization = options.headers.containsKey(HttpHeaders.authorizationHeader);
    bool isAuthorizationRequired = !_unAuthorizedAcceptances.contains(options.path.toLowerCase());

    if (isTokenRequest) {
      _checkRefreshTokenAndCallHandler(handler, options);
    } else if (isNotExistsAuthorization || isAuthorizationRequired) {
      handler.next(options);
    } else {
      await _checkTokenAndHandlerNext(options, handler);
    }
  }

  void _checkRefreshTokenAndCallHandler(RequestInterceptorHandler handler, RequestOptions options) {
    if (!_tokenContext.isRefreshTokenAvailable()) {
      handler.reject(RefreshTokenExpireDioError());
    } else {
      handler.next(options);
    }
  }

  Future<void> _checkTokenAndHandlerNext(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _checkExpirationAndGetToken();
    if (token.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    handler.next(options);
  }

  Future<String> _checkExpirationAndGetToken() async {
    if (_tokenContext.isTokenAvailable()) {
      return _tokenContext.token;
    }

    final result = await _tokenService.getTokenAny();
    return result.data?.token ?? SpecialKey.empty.value;
  }
}
