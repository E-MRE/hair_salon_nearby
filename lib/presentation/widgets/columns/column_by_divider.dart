import 'package:flutter/material.dart';

class ColumnByDivider extends StatelessWidget {
  const ColumnByDivider({
    super.key,
    required this.children,
    required this.divider,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isAddDividerBottom = false,
    this.isAddDividerTop = false,
  });

  final List<Widget> children;
  final Widget divider;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  final bool isAddDividerTop;
  final bool isAddDividerBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    final list = <Widget>[];

    if (isAddDividerTop) {
      list.add(divider);
    }

    for (var child in children) {
      list.addAll([child, divider]);
    }

    if (!isAddDividerBottom) {
      list.removeLast();
    }

    return list;
  }
}
