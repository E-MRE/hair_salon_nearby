import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import 'generic_title_dropdown.dart';

class CityDropdownByTitle extends StatelessWidget {
  const CityDropdownByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericTitleDropdown<String>(
      hintText: LocaleKeys.registerForm_cityHint.tr(),
      title: LocaleKeys.registerForm_cityTitle.tr(),
      initialValue: 'İstanbul',
      values: <String>['İstanbul', 'Ankara', 'Sakarya', 'Kayseri'],
      itemTextBuilder: (item) => item,
    );
  }
}
