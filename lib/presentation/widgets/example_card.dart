import 'package:flutter/material.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: const Icon(Icons.icecream),
        title: Text(text),
        subtitle: Text("Number: $number"),
        trailing: const Icon(Icons.food_bank),
      ),
    );
  }
}
