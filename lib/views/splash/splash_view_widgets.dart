import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FlutterLogo(size: 100),
        SizedBox(height: 20),
        Text(
          'Splash View',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SplashLoader extends StatelessWidget {
  final bool showLoader;

  const SplashLoader({
    super.key,
    required this.showLoader,
  });

  @override
  Widget build(BuildContext context) {
    // Maintain size so the layout doesn't jump when loader disappears
    return Visibility(
      visible: showLoader,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: const CircularProgressIndicator(),
    );
  }
}
