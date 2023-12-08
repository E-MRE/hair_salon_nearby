import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';

import '../texts/app_text.dart';

class GenericDropdown<T> extends StatefulWidget {
  const GenericDropdown({
    super.key,
    this.initialValue,
    required this.values,
    this.selectedOption,
    this.useInitialOption = true,
    this.onItemSelected,
    this.hintText,
    this.hintWidget,
    this.itemTextBuilder,
    this.itemWidgetBuilder,
  });

  final T? initialValue;
  final T? selectedOption;
  final bool useInitialOption;
  final List<T> values;
  final String? hintText;
  final Widget? hintWidget;
  final void Function(T? value)? onItemSelected;
  final String Function(T item)? itemTextBuilder;
  final Widget Function(T item)? itemWidgetBuilder;

  @override
  State<GenericDropdown<T>> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T> extends State<GenericDropdown<T>> with _GenericDropdownStateMixin<T> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: widget.selectedOption ?? (widget.useInitialOption ? _value : null),
      onChanged: _setValue,
      menuMaxHeight: context.dynamicHeight(.3),
      items: widget.values.map(_buildItem).cast<DropdownMenuItem<T>>().toList(),
      hint: widget.hintWidget ?? AppText.labelLargeRegular(widget.hintText, context: context),
      selectedItemBuilder: (_) =>
          widget.values.map((item) => _buildMenuItem(item, false)).cast<DropdownMenuItem<T>>().toList(),
    );
  }
}

mixin _GenericDropdownStateMixin<T> on State<GenericDropdown<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      Future.microtask(() => _setValue(widget.initialValue));
    }
  }

  DropdownMenuItem<T> _buildItem(T item) {
    bool isSelected = _value == null ? false : item == _value;

    return _buildMenuItem(item, isSelected);
  }

  DropdownMenuItem<T> _buildMenuItem(item, bool isSelected) {
    String text = widget.itemTextBuilder?.call(item) ?? '-';
    return DropdownMenuItem<T>(
      value: item,
      child: widget.itemWidgetBuilder?.call(item) ??
          AppText.labelLargeRegular(text, context: context)
              .copyWith(fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
    );
  }

  void _setValue(T? value) {
    setState(() {
      _value = value;
    });

    widget.onItemSelected?.call(value);
  }
}
