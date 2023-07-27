import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/enums/special_key.dart';
import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/helpers/token/token_context.dart';
import '../abstract/token_service.dart';

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

    if (isTokenRequest || isNotExistsAuthorization) {
      handler.next(options);
      return;
    }

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
