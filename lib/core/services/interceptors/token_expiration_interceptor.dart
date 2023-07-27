import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/enums/special_key.dart';
import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/helpers/token/token_context.dart';
import '../abstract/token_service.dart';
import '../models/refresh_token_expire_dio_error.dart';

class TokenExpirationInterceptor<TRemote> extends Interceptor {
  final TokenService _tokenService;
  final TokenContext _tokenContext;

  TokenExpirationInterceptor({TokenService? tokenService, TokenContext? tokenContext})
      : _tokenService = tokenService ?? kTokenService,
        _tokenContext = tokenContext ?? kTokenContext;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool isTokenRequest = options.path.toLowerCase() == _tokenService.refreshTokenEndpoint.toLowerCase();
    bool isNotExistsAuthorization = options.headers.containsKey(HttpHeaders.authorizationHeader);

    if (isTokenRequest) {
      _checkRefreshTokenAndCallHandler(handler, options);
    } else if (isNotExistsAuthorization) {
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
