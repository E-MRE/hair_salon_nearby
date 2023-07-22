import 'dependency_injector.dart';

typedef RegisterDependenciesFunction = void Function(DependencyInjector injector);

abstract class InjectionContainer {
  final DependencyInjector injector;

  InjectionContainer({required this.injector});

  void register({RegisterDependenciesFunction? customInjections});
}
