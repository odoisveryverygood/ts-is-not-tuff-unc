import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/revenuecat_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _rc = RevenueCatService();
  bool _isPro = false;
  bool _rcReady = false;

  @override
  void initState() {
    super.initState();
    _initRC();
  }

  Future<void> _initRC() async {
    await _rc.configure(); // uses placeholder key; safe no-op until you add real key
    final pro = await _rc.refreshCustomerInfo();
    if (mounted) {
      setState(() {
        _rcReady = _rc.isConfigured;
        _isPro = pro;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Plan:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Chip(label: Text(_isPro ? 'Pro' : 'Free')),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: !_rcReady
                  ? () => _snack(context, 'RevenueCat not configured yet. Add your SDK key later.')
                  : () async {
                      final ok = await _rc.purchasePro();
                      _snack(context, ok ? 'Thanks for upgrading!' : 'Purchase canceled or failed.');
                      setState(() => _isPro = _rc.isPro);
                    },
              child: const Text('Upgrade to Pro'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: !_rcReady ? null : () async {
                await _rc.restorePurchases();
                setState(() => _isPro = _rc.isPro);
                _snack(context, 'Purchases restored.');
              },
              child: const Text('Restore Purchases'),
            ),
            const SizedBox(height: 32),
            Wrap(spacing: 12, children: [
              ElevatedButton(onPressed: () => context.go('/'), child: const Text('Dashboard')),
              ElevatedButton(onPressed: () => context.go('/workouts'), child: const Text('Workouts')),
              ElevatedButton(onPressed: () => context.go('/nutrition'), child: const Text('Nutrition')),
              ElevatedButton(onPressed: () => context.go('/tracking'), child: const Text('Tracking')),
            ]),
          ],
        ),
      ),
    );
  }

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
