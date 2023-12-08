import 'package:dio/dio.dart';

class DioApiResponseConvertParameterModel<TEntity> {
  Response response;
  final TEntity? Function(dynamic json) parser;
  StackTrace? stackTrace;
  DioExceptionType? dioErrorType;
  String? defaultMessage;

  DioApiResponseConvertParameterModel({
    required this.response,
    required this.parser,
    this.stackTrace,
    this.dioErrorType,
    this.defaultMessage,
  });
}
