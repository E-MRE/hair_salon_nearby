class ApiResponseConvertParameterModel<TEntity> {
  final Map<String, dynamic> json;
  final TEntity Function<TEntity>(Map<String, dynamic> json) parser;
  final String defaultMessage;

  ApiResponseConvertParameterModel({required this.json, required this.parser, this.defaultMessage = ''});
}
