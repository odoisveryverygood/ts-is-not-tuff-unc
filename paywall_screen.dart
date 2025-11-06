import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../providers/subscription_provider.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sub = context.watch<SubscriptionProvider>();
    final offering = sub.offerings?.current;

    return Scaffold(
      appBar: AppBar(title: const Text("Go Pro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            const Text("WoofFit Pro", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("• AI‑personalized workouts
• Diet plans
• Unlimited tracking
• Early features"),
            const SizedBox(height: 24),
            Expanded(
              child: offering == null
                  ? const Center(child: Text("No offering found. Configure RevenueCat."))
                  : ListView(
                      children: offering.availablePackages.map((pkg) {
                        final storeProduct = pkg.storeProduct;
                        final price = storeProduct.priceString;
                        final title = storeProduct.title;
                        return Card(
                          child: ListTile(
                            title: Text(title),
                            subtitle: Text(price),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () => _buy(context, pkg),
                          ),
                        );
                      }).toList(),
                    ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Maybe later"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _buy(BuildContext context, Package pkg) async {
    final sub = context.read<SubscriptionProvider>();
    try {
      await sub.purchase(pkg);
      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Purchase failed: $e")));
      }
    }
  }
}
