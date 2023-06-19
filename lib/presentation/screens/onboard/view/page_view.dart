part of 'onboard_page.dart';

class _PageView extends StatelessWidget {
  const _PageView({Key? key, required this.option})
      : _bigFlex = 13,
        _mediumFlex = 3,
        _smallFlex = 2,
        super(key: key);

  final OnboardingOption option;
  final int _bigFlex;
  final int _mediumFlex;
  final int _smallFlex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: option.color,
      width: double.maxFinite,
      child: Stack(
        children: [_buildBackgroundImage(), AppPadding.allBig(child: _buildColumn(context))],
      ),
    );
  }

  Column _buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLogo(),
        Spacer(flex: _bigFlex),
        _buildDescription(context),
        Spacer(flex: _mediumFlex),
        const _OnboardingButtonArea(),
        Spacer(flex: _smallFlex),
      ],
    );
  }

  AppText _buildDescription(BuildContext context) {
    return AppText.headlineLargeSemiBold(
      option.getDescription,
      context: context,
      color: context.colorScheme.onPrimary.withOpacity(.6),
      maxLines: TextLineType.more,
    );
  }

  AppPadding _buildLogo() {
    return AppPadding.only(
      top: Sizes.large,
      child: Align(
        alignment: Alignment.topLeft,
        child: option.toLogoImage(height: Sizes.large.value, fit: BoxFit.contain),
      ),
    );
  }

  SizedBox _buildBackgroundImage() {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: option.toBackgroundImage(),
    );
  }
}
