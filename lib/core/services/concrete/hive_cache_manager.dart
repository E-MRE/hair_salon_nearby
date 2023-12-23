import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../utils/enums/storage_keys.dart';
import '../../utils/mixins/hive_register_adapter_mixin.dart';
import '../../utils/results/data_result.dart';
import '../../utils/results/result.dart';
import '../abstract/cache_service.dart';
import '../models/local_storage_model.dart';

class HiveCacheManager extends CacheService with HiveRegisterAdapterMixin {
  final String? customDirectory;
  final List<Type> _primitives = [
    int,
    double,
    num,
    BigInt,
    String,
    bool,
    Enum,
    List<int>,
    List<double>,
    List<num>,
    List<BigInt>,
    List<String>,
    List<bool>,
    List<Enum>,
  ];

  HiveCacheManager({this.customDirectory});

  @override
  Future<void> init() async {
    Hive.defaultDirectory = await _getPath();
    registerAdapters();
  }

  @override
  void register<T extends LocalStorageModel<T>>(T Function(dynamic json) fromJson) {
    Hive.registerAdapter<T>(T.toString(), fromJson);
  }

  @override
  Result setValue<T>(StorageKeys key, T item) {
    bool isValidModel = item is LocalStorageModel || item is List<LocalStorageModel>;

    if (!isValidModel && !_isPrimitive<T>()) {
      return Result.error(message: LocaleKeys.storage_invalidStorageItem.tr());
    }

    bool isAdded = false;

    if (item is List<LocalStorageModel>) {
      return _setList<T>(key, item);
    }

    final box = item is List ? _getBox<List>(key) : _getBox<T>(key);
    box.put(key.value, item);
    isAdded = box.containsKey(key.value);
    return Result(success: isAdded, message: isAdded ? '' : LocaleKeys.storage_addError.tr());
  }

  @override
  DataResult<T> getValue<T>(StorageKeys key, {T? defaultValue}) {
    try {
      if (_isList<T>()) {
        throw Exception(LocaleKeys.storage_unsupportedStorageItem.tr());
      }

      final value = _getBox<T>(key).get(key.value, defaultValue: defaultValue);

      if (value == null) {
        return DataResult<T>.error(message: LocaleKeys.storage_valueNotFound.tr(), data: defaultValue);
      }

      return DataResult<T>.success(data: value);
    } catch (exception) {
      return DataResult<T>.error(message: exception.toString(), data: defaultValue);
    }
  }

  @override
  DataResult<List<T>> getListValue<T>(StorageKeys key) {
    try {
      if (_isPrimitive<T>()) {
        final list = _getBox<List>(key).get(key.value);
        if (list == null) {
          return DataResult<List<T>>.error(message: LocaleKeys.storage_valueNotFound.tr());
        }

        return DataResult<List<T>>.success(data: list.cast<T>());
      }

      final box = _getListBox(key);
      if (box.isEmpty) {
        return DataResult<List<T>>.error(message: LocaleKeys.storage_valueNotFound.tr());
      }

      final listData = <T>[];

      for (var i = 0; i < box.keys.length; i++) {
        listData.add(box.get('${key.value}-$i'));
      }

      return DataResult<List<T>>.success(data: listData);
    } catch (exception) {
      return DataResult<List<T>>.error(message: exception.toString());
    }
  }

  @override
  Result deleteValue<T>(StorageKeys key) {
    bool isDelete = false;
    if (_isList<T>()) {
      if (_isPrimitive<T>()) {
        isDelete = _getBox<List>(key).delete(key.value);
      } else {
        final box = _getListBox(key);
        box.clear();
        box.deleteAll(box.keys);
        isDelete = box.isEmpty;
        box.deleteFromDisk();
      }
    } else {
      isDelete = _getBox<T>(key).delete(key.value);
    }

    return Result(success: isDelete, message: isDelete ? '' : LocaleKeys.storage_deleteError.tr());
  }

  Result _setList<T>(StorageKeys key, T items) {
    if (items is! List<LocalStorageModel>) return Result.error(message: LocaleKeys.storage_unsupportedStorageItem.tr());

    final box = _getListBox(key);
    box.clear();
    box.deleteAll(box.keys);

    for (var i = 0; i < items.length; i++) {
      box.put('${key.value}-$i', items[i]);
    }

    final isAdded = items.length == box.keys.length;
    return Result(success: isAdded, message: isAdded ? '' : LocaleKeys.storage_addError.tr());
  }

  Future<String> _getPath() async {
    if (customDirectory != null && customDirectory!.isNotEmpty) {
      return customDirectory!;
    }

    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Box<T> _getBox<T>(StorageKeys key) {
    return Hive.box<T>(name: '${key.value}-${T.toString()}');
  }

  Box _getListBox(StorageKeys key) {
    return Hive.box(name: 'List[${key.value}]');
  }

  bool _isList<T>() => T.toString().toLowerCase().startsWith('list<') && T.toString().endsWith('>');

  bool _isPrimitive<T>() =>
      _primitives.any((element) => T.toString().toLowerCase().contains(element.toString().toLowerCase()));
}
