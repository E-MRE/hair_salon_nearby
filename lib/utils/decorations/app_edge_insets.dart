import 'package:flutter/material.dart';

import '../enum/sizes.dart';

class AppEdgeInsets extends EdgeInsets {
  AppEdgeInsets.zero() : super.all(Sizes.none.value);

  ///Creates insets where all the offsets are `Sizes value`.
  AppEdgeInsets.all(Sizes size) : super.all(size.value);

  ///Creates insets where symmetric horizontal and vertical offsets are `Sizes value`.
  AppEdgeInsets.symmetric({required Sizes horizontal, required Sizes vertical})
      : super.symmetric(horizontal: horizontal.value, vertical: vertical.value);

  ///Creates insets with only the given values non-zero.
  AppEdgeInsets.only({
    Sizes left = Sizes.none,
    Sizes right = Sizes.none,
    Sizes top = Sizes.none,
    Sizes bottom = Sizes.none,
  }) : super.only(
          left: left.value,
          right: right.value,
          top: top.value,
          bottom: bottom.value,
        );

  ///Creates insets where all the offsets are `Sizes.ultraSmall (2)`.
  AppEdgeInsets.allUltraSmall() : super.all(Sizes.ultraSmall.value);

  ///Creates insets where all the offsets are `Sizes.extraSmall (4)`.
  AppEdgeInsets.allExtraSmall() : super.all(Sizes.extraSmall.value);

  ///Creates insets where all the offsets are `Sizes.verySmall (6)`.
  AppEdgeInsets.allVerySmall() : super.all(Sizes.verySmall.value);

  ///Creates insets where all the offsets are `Sizes.prettySmall (8)`.
  AppEdgeInsets.allPrettySmall() : super.all(Sizes.prettySmall.value);

  ///Creates insets where all the offsets are `Sizes.small (12)`.
  AppEdgeInsets.allSmall() : super.all(Sizes.small.value);

  ///Creates insets where all the offsets are `Sizes.medium (16)`.
  AppEdgeInsets.allMedium() : super.all(Sizes.medium.value);

  ///Creates insets where all the offsets are `Sizes.big (24)`.
  AppEdgeInsets.allBig() : super.all(Sizes.big.value);

  ///Creates insets where all the offsets are `Sizes.veryBig (32)`.
  AppEdgeInsets.allVeryBig() : super.all(Sizes.veryBig.value);

  ///Creates insets where all the offsets are `Sizes.extraBig (36)`.
  AppEdgeInsets.allExtraBig() : super.all(Sizes.extraBig.value);

  ///Creates insets where all the offsets are `Sizes.large (48)`.
  AppEdgeInsets.allLarge() : super.all(Sizes.large.value);

  ///Creates insets where all the offsets are `Sizes.huge (96)`.
  AppEdgeInsets.allHuge() : super.all(Sizes.huge.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.ultraSmall (2)`.
  AppEdgeInsets.horizontalUltraSmall() : super.symmetric(horizontal: Sizes.ultraSmall.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.extraSmall (4)`.
  AppEdgeInsets.horizontalExtraSmall() : super.symmetric(horizontal: Sizes.extraSmall.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.verySmall (6)`.
  AppEdgeInsets.horizontalVerySmall() : super.symmetric(horizontal: Sizes.verySmall.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.prettySmall (8)`.
  AppEdgeInsets.horizontalPrettySmall() : super.symmetric(horizontal: Sizes.prettySmall.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.small (12)`.
  AppEdgeInsets.horizontalSmall() : super.symmetric(horizontal: Sizes.small.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.medium (16)`.
  AppEdgeInsets.horizontalMedium() : super.symmetric(horizontal: Sizes.medium.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.big (24)`.
  AppEdgeInsets.horizontalBig() : super.symmetric(horizontal: Sizes.big.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.veryBig (32)`.
  AppEdgeInsets.horizontalVeryBig() : super.symmetric(horizontal: Sizes.veryBig.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.extraBig (36)`.
  AppEdgeInsets.horizontalExtraBig() : super.symmetric(horizontal: Sizes.extraBig.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.large (48)`.
  AppEdgeInsets.horizontalLarge() : super.symmetric(horizontal: Sizes.large.value);

  ///Creates insets with symmetrical horizontal offsets `Sizes.huge (96)`.
  AppEdgeInsets.horizontalHuge() : super.symmetric(horizontal: Sizes.huge.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.ultraSmall (2)`.
  AppEdgeInsets.verticalUltraSmall() : super.symmetric(vertical: Sizes.ultraSmall.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.extraSmall (4)`.
  AppEdgeInsets.verticalExtraSmall() : super.symmetric(vertical: Sizes.extraSmall.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.verySmall (6)`.
  AppEdgeInsets.verticalVerySmall() : super.symmetric(vertical: Sizes.verySmall.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.prettySmall (8)`.
  AppEdgeInsets.verticalPrettySmall() : super.symmetric(vertical: Sizes.prettySmall.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.small (12)`.
  AppEdgeInsets.verticalSmall() : super.symmetric(vertical: Sizes.small.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.medium (16)`.
  AppEdgeInsets.verticalMedium() : super.symmetric(vertical: Sizes.medium.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.big (24)`.
  AppEdgeInsets.verticalBig() : super.symmetric(vertical: Sizes.big.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.veryBig (32)`.
  AppEdgeInsets.verticalVeryBig() : super.symmetric(vertical: Sizes.veryBig.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.extraBig (36)`.
  AppEdgeInsets.verticalExtraBig() : super.symmetric(vertical: Sizes.extraBig.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.large (48)`.
  AppEdgeInsets.verticalLarge() : super.symmetric(vertical: Sizes.large.value);

  ///Creates insets with symmetrical vertical offsets `Sizes.huge (96)`.
  AppEdgeInsets.verticalHuge() : super.symmetric(vertical: Sizes.huge.value);
}
