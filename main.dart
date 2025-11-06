import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/firebase_service.dart';
import 'services/revenuecat_service.dart';
import 'providers/subscription_provider.dart';
import 'ui/login_screen.dart';
import 'ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // If you add firebase_options.dart, you can pass options here.
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  await RevenueCatService.init(); // Safe to call early

  runApp(const WoofFitApp());
}

class WoofFitApp extends StatelessWidget {
  const WoofFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()..bootstrap()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WoofFit AI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF8A00)), // corgi-ish orange
          useMaterial3: true,
        ),
        home: const RootRouter(),
      ),
    );
  }
}

class RootRouter extends StatelessWidget {
  const RootRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) return const LoginScreen();
    return const HomeScreen();
  }
}
