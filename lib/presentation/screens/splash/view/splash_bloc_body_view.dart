part of 'splash_page.dart';

class _SplashBlocBodyView extends StatelessWidget {
  const _SplashBlocBodyView(this.splashViewModel);

  final SplashViewModel splashViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseBlocProviderView<SplashCubit, SplashState>(
      create: (context) => CoreDependencies.getDependency<SplashCubit>()..checkUpdate(),
      listener: _buildListener,
      loadingChildBuilder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AssetsConstants.instance.getPngImages.icSplashLogo.image(),
            EmptySpace.bigHeight(),
            const CircularProgressIndicator(),
          ],
        );
      },
    );
  }

  void _buildListener(BuildContext context, SplashState state) {
    if (state.isSuccess) {
      _initializeAndNavigate(context);
    } else if (state.processStatus == ProcessStatus.minorUpdate || state.processStatus == ProcessStatus.majorUpdate) {
      _displayUpdateMessage(context, state.processStatus);
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

  void _displayUpdateMessage(BuildContext context, ProcessStatus processStatus) {
    if (![ProcessStatus.majorUpdate, ProcessStatus.minorUpdate].contains(processStatus)) return;

    DisplayAlertDialog(context).customAlert(
      dismissible: false,
      content: processStatus == ProcessStatus.minorUpdate
          ? UpdateAppAlertContent.minor(
              leftButtonPressed: () => _initializeAndNavigate(context),
              rightButtonPressed: () {
                //TODO: add launchUrl
              },
            )
          : UpdateAppAlertContent.major(rightButtonPressed: () {}),
    );
  }
}
