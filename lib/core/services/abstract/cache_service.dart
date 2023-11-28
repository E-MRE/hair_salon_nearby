import '../../utils/enums/storage_keys.dart';
import '../../utils/results/data_result.dart';
import '../../utils/results/result.dart';
import '../models/local_storage_model.dart';

/// This abstract is includes all necessary locale storage functions.
/// It means, if you want to use any manager to manage your locale operation, your manager have to includes those methods.
abstract class CacheService {
  /// Add your register adapter function if you want
  Future<void> init();

  void register<T extends LocalStorageModel<T>>(T Function(dynamic json) fromJson);

  /// Get data what you want from locale
  DataResult<T> getValue<T>(StorageKeys key, {T? defaultValue});

  /// Get list of data. When you set data like a List use this method for get data.
  DataResult<List<T>> getListValue<T>(StorageKeys key);

  /// set data what you want to save locale
  Result setValue<T>(StorageKeys key, T item);

  /// delete data what you want to delete it
  Result deleteValue<T>(StorageKeys key);
}
