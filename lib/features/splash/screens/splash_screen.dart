import 'package:aifit/features/splash/application/splash_notifier.dart';
import 'package:aifit/features/splash/application/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashNotifierProvider, (p, n) {
      if (n is SplashStateLoaded) {
        context.go('/home');
      } else if (n is SplashStateMissingUserInfo) {
        context.go('/user-details');
      }
    });
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Initializzazione in corso...'),
              const SizedBox(height: 16),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
