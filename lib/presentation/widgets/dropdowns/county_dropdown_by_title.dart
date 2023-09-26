import 'package:flutter/material.dart';

import 'generic_title_dropdown.dart';

class CountyDropdownByTitle extends StatelessWidget {
  const CountyDropdownByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericTitleDropdown<String>(
      hintText: 'Bir ilçe seçin',
      title: 'İlçe',
      initialValue: 'Zeytinburnu',
      values: <String>['Zeytinburnu', 'Adapazarı', 'Cennet Mahallesi', 'Serdivan'],
      itemTextBuilder: (item) => item,
    );
  }
}
