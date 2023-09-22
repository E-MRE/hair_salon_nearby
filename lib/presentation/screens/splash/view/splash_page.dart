import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../view_model/splash_view_model.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SplashViewModel(tokenContext: kTokenContext, cacheService: kCacheService);
    Future.microtask(() => _initializeAndNavigate());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            AssetsConstants.instance.getPngImages.icSplashBackground.image(),
            AssetsConstants.instance.getPngImages.icSplashLogo.image(),
          ],
        ),
      ),
    );
  }

  void _navigateByRoute(PageRouteInfo route) async {
    FlutterNativeSplash.remove();
    context.router.replace(route);
  }

  void _initializeAndNavigate() {
    _viewModel.getRouteInfo().then((value) => _navigateByRoute(value));
  }
}
