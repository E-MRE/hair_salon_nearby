import 'package:collection/collection.dart';

enum ProcessStatus {
  undefined(99, 'Undefined'),
  success(200, 'Success'),
  badRequest(400, 'BadRequest'),
  accessDenied(452, 'AccessDenied'),
  notFound(404, 'NotFound'),
  accountLocked(423, 'AccountLocked'),
  internalServerError(500, 'InternalServerError'),
  error(454, 'Error'),
  majorUpdate(101, 'MajorUpdate'),
  minorUpdate(100, 'MinorUpdate');

  final String name;
  final int code;

  const ProcessStatus(this.code, this.name);
}

extension ProcessStatusExtension on String {
  ProcessStatus toProcessStatus() {
    final find = ProcessStatus.values.firstWhereOrNull((element) => element.name.toLowerCase() == toLowerCase());

    return find ?? ProcessStatus.undefined;
  }
}
