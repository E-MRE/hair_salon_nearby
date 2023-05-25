import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/constants/endpoint_constants.dart';
import '../abstract/token_service.dart';
import '../constants/api_constants.dart';

class TokenExpirationInterceptor<TRemote> extends Interceptor {
  final TokenService tokenService;
  final RemoteTokenCallback remoteTokenRequest;
  final bool isUtc;

  TokenExpirationInterceptor({required this.tokenService, required this.remoteTokenRequest, this.isUtc = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool isTokenRequest = options.path.toLowerCase() == EndpointConstants.token.toLowerCase();
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
    if (ApiConstants.token.isNotEmpty && tokenService.isTokenAvailable(ApiConstants.tokenExpirationDate)) {
      return ApiConstants.token;
    }

    final result = await tokenService.getTokenAny(remoteRequest: remoteTokenRequest);
    return result.data ?? '';
  }
}