part of 'main.dart';

//TODO: check this class. it calls before app start.
class _AppStart {
  final String _localizationAssetPath = 'assets/translations';
  Future<void> init() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await CacheServiceFactory.instance.initialize();
    await _environmentLoad();
    await EasyLocalization.ensureInitialized();
    _setDeviceOrientations();
  }

  MultiProvider _setMultiProviderByChild({required List<Provider> providers, required Widget child}) {
    return MultiProvider(providers: providers, child: child);
  }

  void _setDeviceOrientations() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future<void> _environmentLoad() async {
    await dotenv.load(fileName: AppConstants.environmentProfile.path);
  }
}
