import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'presentation/theme/concrete/custom_theme/app_theme_light.dart';
import 'presentation/theme/theme_manager.dart';
import 'utils/constants/app_constants.dart';
import 'utils/enum/localization_locales.dart';
import 'utils/helpers/cache_service_factory.dart';
import 'utils/helpers/custom_responsive_wrapper.dart';
import 'utils/navigation/auto_router/app_router.dart';
import 'utils/navigation/generate_router/navigation_manager.dart';
import 'utils/navigation/generate_router/navigation_route_manager.dart';
import 'utils/navigation/generate_router/navigation_route_service.dart';
import 'utils/navigation/generate_router/navigation_service.dart';

part './app_start.dart';

void main() async {
  final _appStart = _AppStart();
  final _appRouter = AppRouter();
  await _appStart.init();

  runApp(EasyLocalization(
    child: DevicePreview(
      enabled: AppConstants.getDevicePreviewEnable(),
      builder: (context) => _appStart._setMultiProviderByChild(
        providers: [
          Provider<NavigationService>(create: (context) => NavigationManager()),
          Provider<NavigationRouteService>(create: (context) => NavigationRouteManager()),
        ],
        child: MyAppByAutoRoute(appRouter: _appRouter),
      ),
    ),
    supportedLocales: LocalizationLocales.init.supportedLocales,
    path: _appStart._localizationAssetPath,
    fallbackLocale: LocalizationLocales.init.rawValue,
    startLocale: LocalizationLocales.init.rawValue,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          CustomResponsiveWrapper(breakpoints: AppConstants.responsiveBreakpoints, child: child),
      title: AppConstants.appName,
      theme: ThemeManager(theme: AppThemeLight()).createTheme,
      navigatorKey: context.read<NavigationService>().navigatorKey,
      onGenerateRoute: context.read<NavigationRouteService>().generateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

class MyAppByAutoRoute extends StatelessWidget {
  MyAppByAutoRoute({Key? key, required this.appRouter}) : super(key: key) {
    FlutterNativeSplash.remove();
  }

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => CustomResponsiveWrapper(
        breakpoints: AppConstants.responsiveBreakpoints,
        debugLog: true,
        child: child,
      ),
      title: AppConstants.appName,
      theme: ThemeManager(theme: AppThemeLight()).createTheme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
