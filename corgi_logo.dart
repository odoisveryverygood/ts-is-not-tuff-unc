import 'package:flutter/material.dart';

class CorgiLogo extends StatelessWidget {
  const CorgiLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/corgi.png', width: 96, height: 96, fit: BoxFit.contain),
        const SizedBox(height: 8),
        Text('WoofFit AI', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
