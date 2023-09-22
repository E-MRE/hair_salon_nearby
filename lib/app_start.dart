part of 'main.dart';

class _AppStart with AppStartInitializerGeneratorMixin {
  final String _localizationAssetPath = 'assets/translations';

  Future<void> init() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    _setDeviceOrientations();

    await _initializeAll(widgetsBinding);
  }

  MultiProvider _setMultiProviderByChild({required List<SingleChildWidget> providers, required Widget child}) {
    return MultiProvider(providers: providers, child: child);
  }

  void _setDeviceOrientations() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future<void> _initializeAll(WidgetsBinding widgetsBinding) async {
    final initializers = generateInitializers(widgetsBinding);
    for (var initializer in initializers) {
      if (initializer is FutureAppStartInitializer) {
        await initializer.initialize();
      } else {
        initializer.initialize();
      }
    }
  }
}
