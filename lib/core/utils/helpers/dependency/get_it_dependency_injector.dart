import 'dart:async';

import 'package:get_it/get_it.dart' as get_it;

import 'dependency_injector.dart';

class GetItDependencyInjector implements DependencyInjector {
  final get_it.GetIt _injector;

  GetItDependencyInjector() : _injector = get_it.GetIt.instance;

  @override
  T get<T extends Object>({String? instanceName, param1, param2, Type? type}) {
    return _injector.get<T>(instanceName: instanceName, param1: param1, param2: param2, type: type);
  }

  @override
  bool isRegistered<T extends Object>({Object? instance, String? instanceName}) {
    return _injector.isRegistered<T>(instance: instance, instanceName: instanceName);
  }

  @override
  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc, {String? instanceName}) {
    _injector.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    _injector.registerLazySingleton<T>(factoryFunc, instanceName: instanceName, dispose: dispose);
  }

  @override
  T registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    return registerSingleton<T>(instance, instanceName: instanceName, signalsReady: signalsReady, dispose: dispose);
  }

  @override
  Future<void> reset({bool dispose = true}) async {
    await _injector.reset(dispose: dispose);
  }

  @override
  FutureOr resetLazySingleton<T extends Object>({
    T? instance,
    String? instanceName,
    FutureOr Function(T p1)? disposingFunction,
  }) {
    return resetLazySingleton<T>(instance: instance, instanceName: instanceName, disposingFunction: disposingFunction);
  }

  @override
  FutureOr unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T p1)? disposingFunction,
  }) {
    return unregister<T>(instance: instance, instanceName: instanceName, disposingFunction: disposingFunction);
  }
}
