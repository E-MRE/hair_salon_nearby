part of 'login_page.dart';

class _LoginTitleArea extends StatelessWidget {
  const _LoginTitleArea({Key? key, required this.isVisible}) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        EmptySpace.bigHeight(),
        _buildTitle(context),
        _buildSubTitle(context),
        EmptySpace.bigHeight(),
      ],
    );
  }

  AppText _buildTitle(BuildContext context) {
    return AppText.headlineMediumSemiBold(
      LocaleKeys.login_welcome.tr(),
      context: context,
      color: context.colorScheme.secondary,
    );
  }

  AppText _buildSubTitle(BuildContext context) {
    return AppText.titleLargeRegular(
      LocaleKeys.login_niceToSeeYou.tr(),
      context: context,
      color: context.colorScheme.secondary,
    );
  }
}
