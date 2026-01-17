import 'package:flutter/material.dart';
import '../../constant/spacing_constant.dart';
import '../../constant/string_constant.dart';
import '../../constant/text_constant.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FlutterLogo(size: 100),
        SizedBox(height: SpacingConstants.large),
        const Text(
          StringConstants.splashText,
          style: TextConstants.headlineBold,
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
