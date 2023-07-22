abstract class ResponseJsonConverter<TResponse> {
  TResponse fromJson<TParams>(TParams otherParams);
}
