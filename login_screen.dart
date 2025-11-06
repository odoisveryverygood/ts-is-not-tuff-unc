import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 90),
                const SizedBox(height: 24),
                Text("WoofFit AI", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _loading ? null : _signInAnon,
                  child: _loading ? const CircularProgressIndicator() : const Text("Continue"),
                ),
                const SizedBox(height: 12),
                const Text("Anonymous sign-in for demo.
Hook up OAuth/email later.", textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInAnon() async {
    setState(() { _loading = true; _error = null; });
    try {
      final cred = await FirebaseService.signInAnon();
      await FirebaseService.saveBasicProfile(cred.user!);
    } catch (e) {
      setState(() { _error = "Sign-in failed: $e"; });
    } finally {
      if (mounted) setState(() { _loading = false; });
    }
  }
}
