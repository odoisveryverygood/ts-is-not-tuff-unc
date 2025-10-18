import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Set up your dog (breed, age, weight, goals).', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              Wrap(spacing: 12, children: [
                ElevatedButton(onPressed: () => context.go('/'), child: const Text('Dashboard')),
                ElevatedButton(onPressed: () => context.go('/workouts'), child: const Text('Workouts')),
                ElevatedButton(onPressed: () => context.go('/nutrition'), child: const Text('Nutrition')),
                ElevatedButton(onPressed: () => context.go('/tracking'), child: const Text('Tracking')),
                ElevatedButton(onPressed: () => context.go('/settings'), child: const Text('Settings')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
