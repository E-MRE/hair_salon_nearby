import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/decorations/empty_space.dart';
import '../../../utils/enum/text_line_type.dart';
import '../texts/app_text.dart';

class TitleTextFormField extends StatefulWidget {
  const TitleTextFormField({
    super.key,
    required this.title,
    this.initialValue,
    this.hintText,
    this.isObscureText = false,
    this.controller,
    this.focusNode,
    this.minLines,
    this.maxLines,
  });

  final String title;
  final String? hintText;
  final String? initialValue;

  final int? minLines;
  final int? maxLines;
  final bool isObscureText;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<TitleTextFormField> createState() => _TitleTextFormFieldState();
}

class _TitleTextFormFieldState extends State<TitleTextFormField> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _setVisibility(!widget.isObscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText.bodySmallRegular(widget.title, context: context, color: context.colorScheme.onBackground),
        EmptySpace.extraSmallHeight(),
        TextFormField(
          obscureText: !_isVisible,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          controller: widget.controller,
          minLines: widget.minLines,
          maxLines: widget.isObscureText
              ? TextLineType.loose.value
              : (widget.minLines != null ? widget.maxLines ?? widget.minLines : widget.maxLines),
          keyboardType: widget.minLines != null ? TextInputType.multiline : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isObscureText ? _buildObscureIconButton() : null,
          ),
        )
      ],
    );
  }

  IconButton _buildObscureIconButton() {
    return IconButton(
      onPressed: () => _setVisibility(!_isVisible),
      icon: Icon(_isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
    );
  }

  void _setVisibility(bool isVisible) {
    setState(() {
      _isVisible = isVisible;
    });
  }
}
