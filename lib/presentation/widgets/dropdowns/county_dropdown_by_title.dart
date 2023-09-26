import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import 'generic_title_dropdown.dart';

class CountyDropdownByTitle extends StatelessWidget {
  const CountyDropdownByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericTitleDropdown<String>(
      hintText: LocaleKeys.registerForm_countyHint.tr(),
      title: LocaleKeys.registerForm_countyTitle.tr(),
      initialValue: 'Zeytinburnu',
      values: <String>['Zeytinburnu', 'Adapazarı', 'Cennet Mahallesi', 'Serdivan'],
      itemTextBuilder: (item) => item,
    );
  }
}
