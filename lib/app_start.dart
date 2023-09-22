part of 'main.dart';

class _AppStart with HiveRegisterAdaptersMixin {
  final String _localizationAssetPath = 'assets/translations';
  Future<void> init() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await EasyLocalization.ensureInitialized();
    _setDeviceOrientations();
    GetItInjectionContainer.instance.register();
    registerAdapters();
    await kCacheService.init();
    //TODO: Add token to the token coontext
  }

  MultiProvider _setMultiProviderByChild({required List<SingleChildWidget> providers, required Widget child}) {
    return MultiProvider(providers: providers, child: child);
  }

  void _setDeviceOrientations() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
