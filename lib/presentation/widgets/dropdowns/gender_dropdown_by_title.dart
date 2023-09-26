import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../../utils/enum/gender.dart';
import 'generic_title_dropdown.dart';

class GenderDropdownByTitle extends StatefulWidget {
  const GenderDropdownByTitle({super.key, this.initialGender = Gender.man, this.onGenderSelected});

  final Gender initialGender;
  final void Function(Gender gender)? onGenderSelected;

  @override
  State<GenderDropdownByTitle> createState() => _GenderDropdownByTitleState();
}

class _GenderDropdownByTitleState extends State<GenderDropdownByTitle> {
  late Gender _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    return GenericTitleDropdown<Gender>(
      hintText: LocaleKeys.gender_choose.tr(),
      values: Gender.values,
      initialValue: _gender,
      onItemSelected: _setGender,
      itemTextBuilder: (item) => item.toText(),
      title: LocaleKeys.gender_value.tr(),
    );
  }

  void _setGender(Gender? gender) {
    if (gender == null) return;

    setState(() {
      _gender = gender;
    });

    widget.onGenderSelected?.call(gender);
  }
}
