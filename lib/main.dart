import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'presentation/theme/abstract/theme_service.dart';
import 'presentation/theme/theme_manager.dart';
import 'utils/constants/app_constants.dart';
import 'utils/enum/hair_salon_type.dart';
import 'utils/enum/localization_locales.dart';
import 'utils/helpers/custom_responsive_wrapper.dart';
import 'utils/helpers/initializers/app_start_initializer.dart';
import 'utils/mixins/app_start_initializer_generator_mixin.dart';
import 'utils/navigation/auto_router/app_router.dart';

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
          ChangeNotifierProvider<ThemeService>(create: (_) => ThemeManager(theme: HairSalonType.women.getTheme))
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

class MyAppByAutoRoute extends StatelessWidget {
  const MyAppByAutoRoute({Key? key, required this.appRouter}) : super(key: key);

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
      theme: context.watch<ThemeService>().createTheme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
