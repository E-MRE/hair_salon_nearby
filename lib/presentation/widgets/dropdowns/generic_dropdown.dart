import 'package:flutter/material.dart';

import '../texts/app_text.dart';

class GenericDropdown<T> extends StatefulWidget {
  const GenericDropdown({
    super.key,
    this.initialValue,
    required this.values,
    this.onItemSelected,
    this.hintText,
    this.hintWidget,
    this.itemTextBuilder,
    this.itemWidgetBuilder,
  });

  final T? initialValue;
  final List<T> values;
  final String? hintText;
  final Widget? hintWidget;
  final void Function(T value)? onItemSelected;
  final String Function(T item)? itemTextBuilder;
  final Widget Function(T item)? itemWidgetBuilder;

  @override
  State<GenericDropdown<T>> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T> extends State<GenericDropdown<T>> with _GenericDropdownStateMixin<T> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: widget.hintWidget ?? AppText.labelLargeRegular(widget.hintText, context: context),
      items: widget.values.map(_buildItem).cast<DropdownMenuItem<T>>().toList(),
      value: _value,
      onChanged: _setValue,
    );
  }
}

mixin _GenericDropdownStateMixin<T> on State<GenericDropdown<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  DropdownMenuItem<T> _buildItem(T item) {
    String text = widget.itemTextBuilder?.call(item) ?? '-';
    return DropdownMenuItem<T>(
      value: item,
      child: widget.itemWidgetBuilder?.call(item) ?? AppText.labelLargeRegular(text, context: context),
    );
  }

  void _setValue(T? value) {
    if (value == null) return;

    setState(() {
      _value = value;
    });

    widget.onItemSelected?.call(value);
  }
}
