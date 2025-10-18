import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/theme/app_theme.dart';
import 'app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: WoofFitApp()));
}

class WoofFitApp extends StatelessWidget {
  const WoofFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WoofFit AI',
      theme: AppTheme.light(),
      routerConfig: appRouter,
    );
  }
}
