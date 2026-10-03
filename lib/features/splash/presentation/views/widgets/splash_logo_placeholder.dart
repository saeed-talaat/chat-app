import 'package:flutter/material.dart';

class SplashLogoPlaceholder extends StatelessWidget {
  const SplashLogoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Icon(
        Icons.chat_rounded,
        size: 60,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
