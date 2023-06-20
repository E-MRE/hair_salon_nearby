part of '../view/onboard_page.dart';

class _OnboardingButtonArea extends StatelessWidget {
  const _OnboardingButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _HairSalonOutlinedButton()),
        EmptySpace.mediumWidth(),
        const Expanded(child: _UserElevatedButton()),
      ],
    );
  }
}
