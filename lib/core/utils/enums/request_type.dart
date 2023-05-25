enum RequestType {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  final String value;
  const RequestType(this.value);
}
