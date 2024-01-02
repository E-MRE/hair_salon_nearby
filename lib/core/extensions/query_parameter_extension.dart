extension QueryParameterExtension on Map<String, dynamic> {
  Map<String, dynamic> toQueryMap() {
    return this..removeWhere((key, value) => value == null || value.toString().isEmpty);
  }
}
