part of 'splash_page.dart';

class _SplashBlocBodyView extends StatelessWidget {
  const _SplashBlocBodyView(this.splashViewModel);

  final SplashViewModel splashViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseBlocProviderView<SplashCubit, SplashState>(
      create: (context) => SplashCubit()..checkUpdate(),
      listener: _buildListener,
      loadingChildBuilder: (_, __) => AppPadding.only(
        top: Sizes.extraExtraExtraBig,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _buildListener(BuildContext context, SplashState state) {
    if (state.isSuccess) {
      _initializeAndNavigate(context);
    } else if (state.status == StateStatus.error) {
      DisplaySnackBar(context).errorMessage(state.errorMessage);
      Future.delayed(DurationTypes.twoSeconds.rawValue()).then((_) => _navigateByRoute(context, LoginRoute()));
    }
  }

  void _navigateByRoute(BuildContext context, PageRouteInfo route) async {
    context.router.replace(route);
  }

  void _initializeAndNavigate(BuildContext context) {
    splashViewModel.getRouteInfo().then((value) => _navigateByRoute(context, value));
  }
}
