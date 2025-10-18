
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'common/theme/app_theme.dart';
import 'app_router.dart';
import 'services/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try { await FirebaseService().testWrite(); } catch (_) {}
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
