import 'package:flutter/material.dart';

import '../enum/sizes.dart';
import 'app_edge_insets.dart';

class AppPadding extends Padding {
  AppPadding.zero({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.zero(), child: child);

  AppPadding.all({Key? key, required Sizes size, Widget? child})
      : super(key: key, padding: AppEdgeInsets.all(size), child: child);

  AppPadding.symmetric({Key? key, required Sizes horizontal, required Sizes vertical, Widget? child})
      : super(key: key, padding: AppEdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: child);

  AppPadding.only({
    Key? key,
    Sizes left = Sizes.none,
    Sizes right = Sizes.none,
    Sizes top = Sizes.none,
    Sizes bottom = Sizes.none,
    Widget? child,
  }) : super(
          key: key,
          padding: AppEdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
          child: child,
        );

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.big (24)` value.
  AppPadding.page({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.allBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.extraSmall (4)` value.
  AppPadding.allExtraSmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.allExtraSmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.prettySmall (8)` value.
  AppPadding.allPrettySmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.allPrettySmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.small (12)` value.
  AppPadding.allSmall({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.allSmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.medium (16)` value.
  AppPadding.allMedium({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.allMedium(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.big (24)` value.
  AppPadding.allBig({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.allBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.veryBig (32)` value.
  AppPadding.allVeryBig({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.allVeryBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.extraBig (36)` value.
  AppPadding.allExtraBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.allExtraBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives padding to the `Sizes.large (48)` value.
  AppPadding.allLarge({Key? key, Widget? child}) : super(key: key, padding: AppEdgeInsets.allLarge(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.extraSmall (4)` value.
  AppPadding.horizontalExtraSmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalExtraSmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.prettySmall (8)` value.
  AppPadding.horizontalPrettySmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalPrettySmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.small (12)` value.
  AppPadding.horizontalSmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalSmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.medium (16)` value.
  AppPadding.horizontalMedium({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalMedium(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.big (24)` value.
  AppPadding.horizontalBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.veryBig (32)` value.
  AppPadding.horizontalVeryBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalVeryBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.extraBig (36)` value.
  AppPadding.horizontalExtraBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalExtraBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives horizontal padding to the `Sizes.large (48)` value.
  AppPadding.horizontalLarge({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.horizontalLarge(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.extraSmall (4)` value.
  AppPadding.verticalExtraSmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalExtraSmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.prettySmall (8)` value.
  AppPadding.verticalPrettySmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalPrettySmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.small (12)` value.
  AppPadding.verticalSmall({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalSmall(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.medium (16)` value.
  AppPadding.verticalMedium({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalMedium(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.big (24)` value.
  AppPadding.verticalBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.veryBig (32)` value.
  AppPadding.verticalVeryBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalVeryBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.extraBig (36)` value.
  AppPadding.verticalExtraBig({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalExtraBig(), child: child);

  ///A widget that insets its child by the given padding.
  ///It gives vertical padding to the `Sizes.large (48)` value.
  AppPadding.verticalLarge({Key? key, Widget? child})
      : super(key: key, padding: AppEdgeInsets.verticalLarge(), child: child);
}
