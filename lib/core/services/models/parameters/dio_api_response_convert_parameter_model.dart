import 'package:dio/dio.dart';

class DioApiResponseConvertParameterModel<TEntity> {
  Response response;
  final TEntity? Function(Map<String, dynamic> json) parser;
  StackTrace? stackTrace;
  DioErrorType? dioErrorType;
  String? defaultMessage;

  DioApiResponseConvertParameterModel({
    required this.response,
    required this.parser,
    this.stackTrace,
    this.dioErrorType,
    this.defaultMessage,
  });
}
