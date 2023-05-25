import 'dart:io';

import '../../services/constants/api_messages.dart';
import '../results/result.dart';

///Http status code controller.
mixin HttpStatusCodeControllerMixin {
  ///It checks http response status code and returns error messages or success information.
  Result checkStatusCode(int statusCode) {
    if (statusCode < HttpStatus.badRequest) {
      return Result.success();
    } else if (statusCode == HttpStatus.badRequest) {
      return Result.error(message: ApiMessages.instance.BAD_REQUEST);
    } else if (statusCode == HttpStatus.unauthorized) {
      return Result.error(message: ApiMessages.instance.UNAUTHORIZED);
    } else if (statusCode == HttpStatus.forbidden) {
      return Result.error(message: ApiMessages.instance.FORBIDDEN);
    } else if (statusCode == HttpStatus.notFound) {
      return Result.error(message: ApiMessages.instance.NOT_FOUND);
    } else if (statusCode == HttpStatus.internalServerError) {
      return Result.error(message: ApiMessages.instance.INTERNAL_SERVER_ERROR);
    }
    return Result.error(message: ApiMessages.instance.OPERATION_FAILED);
  }
}
