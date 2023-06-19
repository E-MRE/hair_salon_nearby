part of '../view/onboard_page.dart';

class _OnboardingButtonArea extends StatelessWidget {
  const _OnboardingButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _HairSalonOutlinedButton()),
        EmptySpace.normalWidth(),
        const Expanded(child: _UserElevatedButton()),
      ],
    );
  }
}
