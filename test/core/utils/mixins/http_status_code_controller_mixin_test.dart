import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/constants/api_messages.dart';
import 'package:hair_salon_nearby/core/utils/mixins/http_status_code_controller_mixin.dart';
import 'package:hair_salon_nearby/core/utils/results/result.dart';

class HttpStatusCodeController with HttpStatusCodeControllerMixin {}

void main() {
  final statusCodeController = HttpStatusCodeController();
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  group('Test all status codes', () {
    test('test success status code', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.ok);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, false);
      expect(result.success, true);
      expect(result.message, isEmpty);
    });

    test('test status code smaller than bad request', () {
      for (var i = 2000; i < 400; i++) {
        final result = statusCodeController.checkStatusCode(i);
        expect(result, isA<Result>());
        expect(result.isNotSuccess, false);
        expect(result.success, true);
        expect(result.message, isEmpty);
      }
    });

    test('test bad request status code', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.badRequest);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, true);
      expect(result.success, false);
      expect(result.message, ApiMessages.instance.BAD_REQUEST);
    });

    test('test unauthorized status code', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.unauthorized);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, true);
      expect(result.success, false);
      expect(result.message, ApiMessages.instance.UNAUTHORIZED);
    });

    test('test forbidden status code', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.forbidden);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, true);
      expect(result.success, false);
      expect(result.message, ApiMessages.instance.FORBIDDEN);
    });

    test('test not found status code', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.notFound);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, true);
      expect(result.success, false);
      expect(result.message, ApiMessages.instance.NOT_FOUND);
    });

    test('test interval server error status code', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.internalServerError);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, true);
      expect(result.success, false);
      expect(result.message, ApiMessages.instance.INTERNAL_SERVER_ERROR);
    });

    test('test random status code bigger than bad request', () {
      final result = statusCodeController.checkStatusCode(HttpStatus.unsupportedMediaType);
      expect(result, isA<Result>());
      expect(result.isNotSuccess, true);
      expect(result.success, false);
      expect(result.message, ApiMessages.instance.OPERATION_FAILED);
    });
  });
}
