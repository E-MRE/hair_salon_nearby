import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/core/utils/enums/special_key.dart';
import 'package:hair_salon_nearby/models/entity/venue_model.dart';
import 'package:hair_salon_nearby/presentation/widgets/cards/venue/venue_stars_view.dart';
import 'package:hair_salon_nearby/presentation/widgets/images/play_video.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/constants/app_constants.dart';
import 'package:hair_salon_nearby/utils/constants/assets_constants.dart';
import 'package:hair_salon_nearby/utils/decorations/app_box_decoration.dart';
import 'package:hair_salon_nearby/utils/decorations/app_edge_insets.dart';
import 'package:hair_salon_nearby/utils/decorations/app_padding.dart';
import 'package:hair_salon_nearby/utils/decorations/circular_border_radius.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';
import 'package:like_button/like_button.dart';

part 'venue_info_row.dart';
part 'venue_body.dart';
part 'venue_like_button.dart';
part 'venue_top.dart';

final class VenueCard extends StatelessWidget {
  const VenueCard({
    super.key,
    this.distance = 0,
    this.image = '',
    this.info = '-',
    this.isSaved = false,
    this.motto = '-',
    this.name = '-',
    this.stars = 0,
    this.customTopLeft,
    this.customTopRight,
  });

  VenueCard.fromModel({required VenueModel venue, bool isSaved = false, Widget? customTopLeft, Widget? customTopRight})
      : this(
          distance: venue.distance ?? AppConstants.kZero.toDouble(),
          image: venue.image ?? SpecialKey.empty.value,
          info: venue.info ?? SpecialKey.dash.value,
          motto: venue.motto ?? SpecialKey.dash.value,
          name: venue.name ?? SpecialKey.dash.value,
          stars: venue.star ?? AppConstants.kZero.toDouble(),
          customTopLeft: customTopLeft,
          customTopRight: customTopRight,
          isSaved: isSaved,
        );

  final num stars;
  final num distance;
  final String name;
  final String image;
  final String motto;
  final String info;
  final bool isSaved;

  final Widget? customTopLeft;
  final Widget? customTopRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.extraUltraExtraVeryBig.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _VenueTop(
            image: image,
            stars: stars,
            isSaved: isSaved,
            customTopLeft: customTopLeft,
            customTopRight: customTopRight,
          ),
          EmptySpace.prettySmallHeight(),
          _VenueBody(distance: distance, info: info, motto: motto, name: name),
        ],
      ),
    );
  }
}
