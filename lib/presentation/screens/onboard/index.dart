import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../widgets/buttons/on_primary_outlined_button.dart';
import '../../widgets/buttons/primary_elevated_button.dart';
import '../../widgets/texts/app_text.dart';
import './view_model.dart/onboard_cubit.dart';
import './view_model.dart/onboard_state.dart';

part './widgets/hair_salon_outlined_button.dart';
part './widgets/onboard_page_view_indicators.dart';
part './widgets/onboarding_button_area.dart';
part './widgets/user_elevated_button.dart';
part './view/page_view.dart';
part './view/onboard_liquid_swipe_view.dart';
part './view/onboard_page.dart';
