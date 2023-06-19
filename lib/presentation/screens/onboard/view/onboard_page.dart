import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/app_padding.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/enum/onboarding_option.dart';
import '../../../../utils/enum/sizes.dart';
import '../../../../utils/enum/text_line_type.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../../../widgets/buttons/on_primary_outlined_button.dart';
import '../../../widgets/buttons/rounded_elevated_button.dart';
import '../../../widgets/texts/app_text.dart';

part '../widgets/hair_salon_outlined_button.dart';
part '../widgets/user_elevated_button.dart';
part '../widgets/onboarding_button_area.dart';
part 'page_view.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> with _OnboardPageStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            onPageChangeCallback: _onPageChanged,
            liquidController: _liquidController,
            fullTransitionValue: 600,
            pages: OnboardingOption.values.map((option) => _PageView(option: option)).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 94,
            child: AnimatedSmoothIndicator(
              activeIndex: _activePage,
              count: 3,
              effect: WormEffect(
                dotHeight: Sizes.prettySmall.value,
                dotWidth: Sizes.prettySmall.value,
                radius: Sizes.prettySmall.value,
                type: WormType.thin,
                activeDotColor: context.colorScheme.onPrimary,
                dotColor: context.colorScheme.onPrimary.withOpacity(.2),
              ),
              onDotClicked: (index) {
                _onPageChanged(index);
                _liquidController.jumpToPage(page: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

mixin _OnboardPageStateMixin on State<OnboardPage> {
  late final LiquidController _liquidController;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _liquidController = LiquidController();
  }

  void _onPageChanged(int activePageIndex) {
    setState(() {
      _activePage = activePageIndex;
    });
  }
}
