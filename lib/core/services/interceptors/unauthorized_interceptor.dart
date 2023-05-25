import 'dart:io';

import 'package:dio/dio.dart';

typedef UnAuthorizedErrorCallback = void Function(String? message, String path);

class UnAuthorizedInterceptor extends Interceptor {
  final UnAuthorizedErrorCallback onAuthorizationError;

  UnAuthorizedInterceptor(this.onAuthorizationError);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null && err.response!.statusCode == HttpStatus.unauthorized) {
      onAuthorizationError.call(err.message ?? err.response?.statusMessage, err.requestOptions.path);
    }

    handler.reject(err);
  }
}
