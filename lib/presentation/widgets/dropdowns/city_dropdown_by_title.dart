import 'package:flutter/material.dart';

import 'generic_title_dropdown.dart';

class CityDropdownByTitle extends StatelessWidget {
  const CityDropdownByTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericTitleDropdown<String>(
      hintText: 'Bir il seçin',
      title: 'İl',
      initialValue: 'İstanbul',
      values: <String>['İstanbul', 'Ankara', 'Sakarya', 'Kayseri'],
      itemTextBuilder: (item) => item,
    );
  }
}
