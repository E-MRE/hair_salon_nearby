import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../texts/app_text.dart';
import 'generic_dropdown.dart';

class GenericTitleDropdown<T> extends StatelessWidget {
  const GenericTitleDropdown({
    super.key,
    this.initialValue,
    required this.values,
    this.onItemSelected,
    this.selectedOption,
    this.useInitialOption = true,
    this.hintText,
    this.hintWidget,
    this.itemTextBuilder,
    this.itemWidgetBuilder,
    this.title,
    this.titleWidget,
  });

  final String? title;
  final Widget? titleWidget;
  final T? initialValue;
  final List<T> values;
  final String? hintText;
  final Widget? hintWidget;
  final T? selectedOption;
  final bool useInitialOption;
  final void Function(T? value)? onItemSelected;
  final String Function(T item)? itemTextBuilder;
  final Widget Function(T item)? itemWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        titleWidget ??
            AppText.bodySmallRegular(
              title,
              context: context,
              color: context.colorScheme.onBackground,
            ),
        GenericDropdown<T>(
          values: values,
          hintText: hintText,
          hintWidget: hintWidget,
          initialValue: initialValue,
          selectedOption: selectedOption,
          itemWidgetBuilder: itemWidgetBuilder,
          useInitialOption: useInitialOption,
          itemTextBuilder: itemTextBuilder,
          onItemSelected: onItemSelected,
        ),
      ],
    );
  }
}
