enum Headers { applicationJson, urlEncoded }

extension HeadersExtension on Headers {
  Map<String, String> rawValue() {
    switch (this) {
      case Headers.urlEncoded:
        return {'Content-Type': 'application/x-www-form-urlencoded'};

      case Headers.applicationJson:
        return {'Content-type': 'application/json; charset=UTF-8'};
    }
  }
}
