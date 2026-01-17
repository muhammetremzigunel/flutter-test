import 'package:flutter/material.dart';
import '../../constant/spacing_constant.dart';
import '../../constant/text_constant.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(height: SpacingConstants.xLarge),
        Text(
          title,
          style: TextConstants.headlineBold,
        ),
        SizedBox(height: SpacingConstants.large),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SpacingConstants.horizontalPadding),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextConstants.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class OnboardingActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const OnboardingActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingConstants.horizontalPadding,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: TextConstants.buttonLabel,
      ),
    );
  }
}
