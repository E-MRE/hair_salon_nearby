import 'package:dio/dio.dart';

extension OptionsExtension on BaseOptions {
  Options toOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      extra: extra,
      headers: headers,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      listFormat: listFormat,
    );
  }
}

extension BaseOptionsExtension on Options {
  BaseOptions toBaseOptions(
      {required String baseUrl, Map<String, dynamic>? queryParameters, bool? persistentConnection}) {
    return BaseOptions(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      extra: extra,
      headers: headers,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      listFormat: listFormat,
      connectTimeout: receiveTimeout,
      baseUrl: baseUrl,
      queryParameters: queryParameters,
      persistentConnection: persistentConnection,
    );
  }
}
