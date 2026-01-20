import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/spacing_constant.dart';
import '../home/home_view.dart';
import '../onboarding/onboarding_view.dart';
import 'splash_view_widgets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isOnboardingCompleted = prefs.getBool('is_onboarding_completed') ?? false;

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        if (isOnboardingCompleted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnboardingView()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SplashLogo(),
            SizedBox(height: SpacingConstants.large),
            const SplashLoader(showLoader: true),
          ],
        ),
      ),
    );
  }
}
