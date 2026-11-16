import 'dart:async';

import 'package:flutter/material.dart';

/// Welcome screen shown once when the app opens, then replaced by [next].
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.next,
    this.duration = const Duration(seconds: 3),
  });

  /// Page to open after the welcome screen (the main app shell).
  final Widget next;

  /// How long the welcome screen stays on screen.
  final Duration duration;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => widget.next));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        // ===== BACKGROUND =====
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [scheme.primary, scheme.tertiary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ===== GRADUATE (Irasutoya) =====
            // White circle so the picture stands out on the gradient.
            Container(
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/welcome_graduate.png'),
            ),
            const SizedBox(height: 24),

            // ===== WELCOME TEXT =====
            Text(
              'Welcome to StudentHub',
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium?.copyWith(
                color: scheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // ===== LOADING INDICATOR =====
            CircularProgressIndicator(color: scheme.onPrimary),
            const SizedBox(height: 16),
            Text(
              'Please wait...',
              style: textTheme.bodyLarge?.copyWith(color: scheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
