import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subscription_provider.dart';
import 'paywall_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sub = context.watch<SubscriptionProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("WoofFit AI"),
        actions: [
          if (!sub.isPro)
            IconButton(
              onPressed: () => _openPaywall(context),
              icon: const Icon(Icons.lock),
              tooltip: "Go Pro",
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(sub.isPro ? Icons.pets : Icons.pets_outlined, size: 64),
            const SizedBox(height: 12),
            Text(sub.isPro ? "Pro Unlocked" : "Free Tier",
              style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: sub.isPro ? () {} : () => _openPaywall(context),
              child: Text(sub.isPro ? "Start AI Plan" : "Unlock Pro"),
            ),
            const SizedBox(height: 12),
            const Text("Demo home screen. Wire your workout/diet features here."),
          ],
        ),
      ),
    );
  }

  void _openPaywall(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
  }
}
