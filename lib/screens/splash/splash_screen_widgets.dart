import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> opacityAnimation;
  final Animation<double> scaleAnimation;

  const SplashLogo({
    super.key,
    required this.controller,
    required this.opacityAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: const Column(
        children: [
          FlutterLogo(size: 100),
          SizedBox(height: 20),
          Text(
            'Splash Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
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
