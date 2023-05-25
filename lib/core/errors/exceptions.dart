import '../services/constants/api_messages.dart';

class ServerException implements Exception {
  String? message;

  ServerException({
    this.message,
  });
}

class CacheException implements Exception {
  String? message;

  CacheException({
    this.message,
  });
}

class TokenException implements Exception {
  String? message;

  TokenException({
    this.message,
  });
}

class ConnectionException implements Exception {
  final String message;

  ConnectionException({String? errorMessage})
      : message = errorMessage ?? ApiMessages.instance.NETWORK_ERROR;
}
