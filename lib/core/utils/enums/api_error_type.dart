enum ApiErrorType {
  statusError(['http status error']),
  timeout(['timeout', 'timed out']),
  unauthorized(['401']),
  serverError(['500', '501', '502']);

  final List<String> errorList;
  const ApiErrorType(this.errorList);
}
