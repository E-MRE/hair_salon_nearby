import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_salon_nearby/models/entity/county_model.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_state.dart';
import 'package:hair_salon_nearby/presentation/widgets/bloc/base_bloc_data_builder_view.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import 'generic_title_dropdown.dart';

class CountyDropdownByTitle extends StatelessWidget {
  const CountyDropdownByTitle({super.key, required this.onCountySelected});

  final void Function(CountyModel? county) onCountySelected;

  @override
  Widget build(BuildContext context) {
    return BaseBlocDataBuilderView<CityCubit, CityState>(
      errorChildBuilder: (_, __) => const SizedBox.shrink(),
      successChildBuilder: (context, state) {
        return GenericTitleDropdown<CountyModel>(
          hintText: LocaleKeys.registerForm_countyHint.tr(),
          title: LocaleKeys.registerForm_countyTitle.tr(),
          values: state.selectedCity?.counties ?? <CountyModel>[],
          itemTextBuilder: (item) => item.countyName ?? '',
          selectedOption: state.selectedCounty,
          useInitialOption: false,
          onItemSelected: (value) {
            context.read<CityCubit>().setCounty(value);
            onCountySelected(value);
          },
        );
      },
    );
  }
}
