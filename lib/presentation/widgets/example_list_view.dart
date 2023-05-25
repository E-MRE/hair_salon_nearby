import 'package:flutter/material.dart';

import 'example_card.dart';

class ExampleListView extends StatelessWidget {
  const ExampleListView({
    Key? key,
    required this.examples,
  }) : super(key: key);

  final List<String> examples;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: examples.length,
        itemBuilder: (context, index) {
          return ExampleCard(
            text: examples[index],
            number: (index + 1),
          );
        });
  }
}
