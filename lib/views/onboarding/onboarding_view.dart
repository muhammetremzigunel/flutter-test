import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/color_constant.dart';
import '../../constant/spacing_constant.dart';
import '../../constant/string_constant.dart';
import '../home/home_view.dart';
import 'onboarding_view_widgets.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': StringConstants.onboarding1Title,
      'description': StringConstants.onboarding1Desc,
      'icon': Icons.rocket_launch,
    },
    {
      'title': StringConstants.onboarding2Title,
      'description': StringConstants.onboarding2Desc,
      'icon': Icons.school,
    },
    {
      'title': StringConstants.onboarding3Title,
      'description': StringConstants.onboarding3Desc,
      'icon': Icons.people,
    },
  ];

  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_onboarding_completed', true);
    if (mounted) {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (_currentPage < _onboardingData.length - 1)
            TextButton(
              onPressed: _completeOnboarding,
              child: const Text(StringConstants.skip),
            ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    title: _onboardingData[index]['title'],
                    description: _onboardingData[index]['description'],
                    icon: _onboardingData[index]['icon'],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SpacingConstants.horizontalPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => Container(
                        margin: EdgeInsets.all(SpacingConstants.small / 2),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? ColorConstants.indicatorActive
                              : ColorConstants.indicatorInactive,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SpacingConstants.xLarge),
                  OnboardingActionButton(
                    label: _currentPage == _onboardingData.length - 1
                        ? StringConstants.getStarted
                        : StringConstants.next,
                    onPressed: _onNext,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
