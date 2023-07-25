abstract class Failure {
  final String message;
  final String failureCode;

  Failure({
    required this.message,
    required this.failureCode,
  });
}

class ServerFailure extends Failure {
  ServerFailure({
    String? message,
    String? failureCode,
  }) : super(
          message: message ?? '',
          failureCode: failureCode ?? '',
        );
}

class CacheFailure extends Failure {
  CacheFailure({
    String? message,
    String? failureCode,
  }) : super(
          message: message ?? '',
          failureCode: failureCode ?? '',
        );
}
