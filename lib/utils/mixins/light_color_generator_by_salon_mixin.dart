import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../enum/hair_salon_type.dart';

mixin LightColorGeneratorBySalonMixin {
  Color getPrimaryColor(BuildContext context, HairSalonType salonType) {
    return switch (salonType) {
      HairSalonType.men => context.colorScheme.primaryContainer,
      HairSalonType.women => context.colorScheme.primary,
      HairSalonType.beautyCentre => context.colorScheme.tertiaryContainer,
    };
  }
}
