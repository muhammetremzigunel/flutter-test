import 'package:flutter/material.dart';
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
      'title': 'Welcome to Flutter Blog',
      'description': 'The best place to read and write about Flutter development.',
      'icon': Icons.rocket_launch,
    },
    {
      'title': 'Learn and Grow',
      'description': 'Stay updated with the latest trends and tutorials in the Flutter ecosystem.',
      'icon': Icons.school,
    },
    {
      'title': 'Connect with Others',
      'description': 'Join a community of thousands of developers around the world.',
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
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  OnboardingActionButton(
                    label: _currentPage == _onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
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
