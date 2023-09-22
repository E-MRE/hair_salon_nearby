import '../../../core/utils/helpers/dependency/get_it_injection_container.dart';
import '../../mixins/custom_dependency_injection_mixin.dart';
import 'app_start_initializer.dart';

class DependencyAppStartInitializer extends AppStartInitializer with CustomDependencyInjectionMixin {
  const DependencyAppStartInitializer();

  @override
  void initialize() {
    GetItInjectionContainer.instance.register(customInjections: registerDependencies);
  }
}
