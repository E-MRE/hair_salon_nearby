class ApiConstants {
  static const int timeoutMilliseconds = 15000;
  static Duration get defaultTimeout => const Duration(milliseconds: timeoutMilliseconds);

  static _ApiEndpoints endpoints = _ApiEndpoints();

  static String token = '';
  static String refreshToken = '';
  static DateTime tokenExpirationDate = DateTime(1);
  static DateTime refreshTokenExpirationDate = DateTime(1);
}

class _ApiEndpoints {
  static const String refreshToken = 'api/Login/RefreshToken';
}
