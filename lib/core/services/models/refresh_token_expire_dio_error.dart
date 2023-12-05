import 'package:dio/dio.dart';

class RefreshTokenExpireDioError extends DioException {
  RefreshTokenExpireDioError()
      : super(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badCertificate,
          message: 'Refresh token is expired!',
        );
}
