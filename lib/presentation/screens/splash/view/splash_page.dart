import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/utils/display_messages/snack_bar/display_snack_bar.dart';
import '../../../../core/utils/enums/duration_types.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/decorations/app_padding.dart';
import '../../../../utils/enum/sizes.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../../../widgets/bloc/base_bloc_provider_view.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';
import '../view_model/splash_view_model.dart';

part 'splash_bloc_body_view.dart';

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
    FlutterNativeSplash.remove();
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
            _SplashBlocBodyView(_viewModel),
          ],
        ),
      ),
    );
  }
}
