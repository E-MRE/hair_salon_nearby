import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TextField(),
          AppText.titleLargeSemiBold('data', context: context),
          EmptySpace.bigHeight(),
          ElevatedButton(onPressed: () {}, child: AppText.labelLargeSemiBold('data', context: context)),
          EmptySpace.bigHeight(),
          OutlinedButton(onPressed: () {}, child: const Text('data')),
          EmptySpace.bigHeight(),
          TextButton(onPressed: () {}, child: const Text('data')),
          EmptySpace.bigHeight(),
        ],
      ),
    );
  }
}
