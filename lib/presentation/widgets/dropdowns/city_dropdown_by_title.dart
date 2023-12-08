import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_state.dart';
import 'package:hair_salon_nearby/presentation/widgets/bloc/base_bloc_data_builder_view.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import 'generic_title_dropdown.dart';

class CityDropdownByTitle extends StatelessWidget {
  const CityDropdownByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocDataBuilderView<CityCubit, CityState>(
      errorChildBuilder: (_, __) => const SizedBox.shrink(),
      successChildBuilder: (context, state) {
        return GenericTitleDropdown<CityModel>(
          onItemSelected: (value) => context.read<CityCubit>().setCity(value),
          hintText: LocaleKeys.registerForm_cityHint.tr(),
          itemTextBuilder: (item) => item.cityName ?? '',
          title: LocaleKeys.registerForm_cityTitle.tr(),
          values: state.data ?? <CityModel>[],
          selectedOption: state.selectedCity,
          useInitialOption: false,
        );
      },
    );
  }
}
