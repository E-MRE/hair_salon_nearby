part of '../index.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late final LiquidController _liquidController;

  @override
  void initState() {
    super.initState();
    _liquidController = LiquidController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocProviderView<OnboardCubit, OnboardState>(
      create: (_) => OnboardCubit(),
      listener: _buildListener,
      initialChildBuilder: (_, __) {
        return Scaffold(
          body: Stack(
            children: [
              _OnboardLiquidSwipeView(controller: _liquidController),
              _OnboardPageViewIndicators(controller: _liquidController),
            ],
          ),
        );
      },
    );
  }

  void _buildListener(BuildContext context, OnboardState state) {
    if (state.isSuccess) {
      context.router.replace(LoginRoute());
    }
  }
}
