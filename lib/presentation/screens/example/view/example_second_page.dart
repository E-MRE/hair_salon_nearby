import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExampleSecondPage extends StatefulWidget {
  const ExampleSecondPage({Key? key}) : super(key: key);

  @override
  State<ExampleSecondPage> createState() => _ExampleSecondPageState();
}

class _ExampleSecondPageState extends State<ExampleSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
