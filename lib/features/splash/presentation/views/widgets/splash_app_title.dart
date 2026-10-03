import 'package:flutter/material.dart';

class SplashAppTitle extends StatelessWidget {
  const SplashAppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chat App',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
