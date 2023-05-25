class ApiConstants {
  static const int timeoutMilliseconds = 15000;
  static Duration get defaultTimeout => const Duration(milliseconds: timeoutMilliseconds);

  static String token = '';
  static DateTime tokenExpirationDate = DateTime(1);
}
