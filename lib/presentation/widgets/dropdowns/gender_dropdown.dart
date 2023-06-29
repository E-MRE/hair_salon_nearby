import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../../utils/enum/gender.dart';
import '../texts/app_text.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key, this.initialGender = Gender.man, this.onGenderSelected});

  final Gender initialGender;
  final void Function(Gender gender)? onGenderSelected;

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  late Gender _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Gender>(
      hint: AppText.labelLargeRegular(LocaleKeys.gender_choose.tr(), context: context),
      items: _buildItems(context),
      value: _gender,
      onChanged: _setGender,
    );
  }

  List<DropdownMenuItem<Gender>> _buildItems(BuildContext context) {
    return Gender.values
        .map(
          (item) => DropdownMenuItem<Gender>(
            value: item,
            child: AppText.labelLargeRegular(item.toText(), context: context),
          ),
        )
        .toList();
  }

  void _setGender(Gender? gender) {
    if (gender == null) return;

    setState(() {
      _gender = gender;
    });

    widget.onGenderSelected?.call(gender);
  }
}
