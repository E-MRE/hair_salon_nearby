import 'package:dio/dio.dart';

class RefreshTokenExpireDioError extends DioError {
  RefreshTokenExpireDioError()
      : super(
          requestOptions: RequestOptions(),
          type: DioErrorType.badCertificate,
          message: 'Refresh token is expired!',
        );
}
