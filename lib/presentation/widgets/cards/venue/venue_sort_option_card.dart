import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/decorations/app_box_decoration.dart';
import 'package:hair_salon_nearby/utils/decorations/app_edge_insets.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

final class VenueSortOptionCard extends StatelessWidget {
  const VenueSortOptionCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.symmetric(horizontal: Sizes.prettySmall, vertical: Sizes.extraSmall),
      decoration: AppBoxDecoration.circularContainer(
        size: Sizes.prettySmall,
        borderColor: Colors.transparent,
        backgroundColor: context.colorScheme.secondary.withOpacity(.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText.labelLargeMedium(text, context: context, color: context.colorScheme.background),
          EmptySpace.extraSmallWidth(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: context.colorScheme.background,
              size: Sizes.medium.value,
            ),
          )
        ],
      ),
    );
  }
}
