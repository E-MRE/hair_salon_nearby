/// You can create new classes from this class to provide your own manager.
class StorageKeys {
  /// Your String Key Name
  final String value;
  const StorageKeys._(this.value);

  static const StorageKeys token = StorageKeys._('token');
}
